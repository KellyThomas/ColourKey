# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

extends Node

onready var player = $"Player"

var library = [
        preload("res://KeySounds/232001__danmitch3ll__xylophone-c2.wav"),
        preload("res://KeySounds/232002__danmitch3ll__xylophone-c.wav"),
        preload("res://KeySounds/232003__danmitch3ll__xylophone-b.wav"),
        preload("res://KeySounds/232004__danmitch3ll__xylophone-a.wav"),
        preload("res://KeySounds/232005__danmitch3ll__xylophone-g.wav"),
        preload("res://KeySounds/232006__danmitch3ll__xylophone-f.wav"),
        preload("res://KeySounds/232006__danmitch3ll__xylophone-f.wav"),
        preload("res://KeySounds/232008__danmitch3ll__xylophone-d1.wav"),
        preload("res://KeySounds/232009__danmitch3ll__xylophone-sweep.wav"),
    ]

var sounds = {}


func _ready():
    randomize()


func _input(event):
    if not event is InputEventKey:
        return
    if event.echo:
        return
    if not event.pressed:
        return
        
    player.stream = sound_for_key(event.scancode)
    player.play()
    

func sound_for_key(code):
        if not code in sounds.keys():
            sounds[code] = random_sound() 
        return sounds[code]


func random_sound():
    return library[randi() % len(library)]
