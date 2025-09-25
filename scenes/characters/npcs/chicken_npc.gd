extends CharacterBody2D

const speed = 10
var current_state = walk
var direction = Vector2.RIGHT

var is_chatting = false
var is_roaming = true

var player 
var player_in_chat_zone = false


enum{
	walk,
	idle,
	new_dir 
}

func _ready():
	randomize()
