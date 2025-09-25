extends StaticBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_components: InteractableComponent = $InteractableComponents


func _ready() -> void:
	interactable_components.interactable_activated.connect(_on_interactable_activated)
	interactable_components.interactable_deactivated.connect(_on_interactable_deactivated)
	collision_layer = 1
	
	
func _on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	print("successfully opened")
	collision_layer = 2
	
func _on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	print ("get out")
	collision_layer = 1
