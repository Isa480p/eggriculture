extends Sprite2D
@onready var damage_component: DamageComponent = $damage_component
@onready var hurt_component: HurtComponent = $HurtComponent


var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage:int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity", 1.0)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity", 0.0)
	
func on_max_damage_reached() -> void:
	call_deferred("add_log_scene")
	print("max_damage_reached")
	queue_free()
	
func add_log_scene() -> void :
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position - Vector2(0,-10)
	get_parent().add_child(log_instance)
