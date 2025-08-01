extends Sprite2D

@onready var damage_component: DamageComponent = $DamageComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var stone_scene = preload("res://scenes/objects/rocks/stone.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage:int) -> void:
	damage_component.apply_damage(hit_damage)
	
func on_max_damage_reached() -> void:
	call_deferred("add_stone_scene")
	print("max_damage_reached")
	queue_free()
	
func add_log_scene() -> void :
	var stone_instance = stone_scene.instantiate() as Node2D
	stone_instance.global_position = global_position - Vector2(0,-10)
	get_parent().add_child(stone_instance)
