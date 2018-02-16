# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

extends Node


onready var background = $"Background"

var colors = {}
var last_key = 0
var transition_start_color = Color(1, 1, 1)
var transition_end_color = Color(1, 1, 1)
var transition_current_color = Color(1, 1, 1)
var transition_duration = 0.25
var transition_progress = 0


func _ready():
    randomize()


func _input(event):
    if not event is InputEventKey:
        return
    if event.echo:
        return
    if not event.pressed:
        return

    start_transition(event.scancode)


func _process(delta):
    if transition_progress >= transition_duration:
        return

    transition_progress = min(transition_progress + delta, transition_duration)
    transition_current_color = transition_current_color.linear_interpolate(transition_end_color, transition_progress)
    background.modulate = transition_current_color


func start_transition(code):
    last_key = code
    transition_progress = 0
    transition_start_color = transition_current_color
    transition_end_color = color_for_key(code)


func color_for_key(code):
    if not code in colors.keys():
        colors[code] = random_color() 
        
    return colors[code]


func random_color():
    return Color(randf(), randf(), randf())
