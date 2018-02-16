# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

extends Node

const target_duration = 3;
const exit_key = KEY_ESCAPE

var key_down = false
var key_down_duration = 0


func _process(delta):
    if key_down:
        key_down_duration += delta
        if key_down_duration >= target_duration:
            get_tree().quit()


func _input(event):
    if event is InputEventKey:
        if not event.echo:
            if event.scancode == exit_key:
                key_down = event.pressed
                if not key_down:
                    key_down_duration = 0
