# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026-present Team LibreELEC (https://libreelec.tv)

from contextlib import contextmanager

import json
import os
import xbmc
import xbmcaddon
import xbmcgui

import subprocess

__ADDON_ID__ = 'script.module.libreelechelper'
__RUN_EXTERNAL__ = '/usr/lib/kodi/run-external-program'

def get_kodi_setting(setting: str) -> str | None:
    query =  '{"jsonrpc":"2.0", "method":"Settings.GetSettingValue", "params":{"setting":"' + setting + '"}, "id":1}'

    rpc_result = xbmc.executeJSONRPC(query)
    json_result = json.loads(rpc_result)

    if 'result' in json_result and 'value' in json_result['result']:
        return json_result['result']['value']
    else:
        return None

def get_kodi_keyboard_layout() -> str | None:
    return get_kodi_setting('input.libinputkeyboardlayout')

def get_kodi_audio_device() -> str | None:
    device = get_kodi_setting('audiooutput.audiodevice')
    xbmc.log(f'raw audio device is {device}')

    if device is None:
        return None

    device = device.split('|')[0]

    xbmc.log(f'split audio device is {device}')

    if device.startswith('PULSE:') or device.startswith('PIPEWIRE:'):
        return device
    elif device.startswith('ALSA:'):
        alsadev = device[5:]
        if alsadev.startswith('@'):
            return 'ALSA:sysdefault'
        else:
            return device
    else:
        return 'ALSA:sysdefault'

def run_external_program(
        executable: str,
        args: list = [],
        env: dict = {},
        confirm_start: bool = True,
        name: str = '') -> None:
    addon = xbmcaddon.Addon(__ADDON_ID__)

    if confirm_start:
        str = addon.getLocalizedString(30000).format(name=name)
        ok = xbmcgui.Dialog().yesno(name, str)
        if not ok:
            return

    # try to determine keyboard layout
    layout = get_kodi_keyboard_layout()
    audiodev = get_kodi_audio_device()
    xbmc.log(f'normalized audio device is {audiodev}')

    environment = {}

    if layout is not None:
        environment['KODI_KEYBOARD_LAYOUT'] = layout
    if audiodev is not None:
        environment['KODI_AUDIO_DEVICE'] = audiodev

    if env is not None:
        environment.update(env)

    cmd = ['systemd-run']

    for k, v in environment.items():
        cmd.append(f'-E{k}={v}')

    cmd.append(__RUN_EXTERNAL__)
    cmd.append(executable)

    if list is not None:
        cmd.extend(args)
    
    xbmc.log(f'starting {cmd!r}')

    subprocess.Popen(cmd, shell=False, close_fds=True)

@contextmanager 
def busy_dialog():
    xbmc.executebuiltin('ActivateWindow(busydialognocancel)')
    try:
        yield
    finally:
        xbmc.executebuiltin('Dialog.Close(busydialognocancel)')

def toast(header: str, message: str, time: int=5000) -> None:
    xbmc.executebuiltin(f'Notification({header}, {message}, {time})')
