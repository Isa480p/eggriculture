class_name HurtComponent
extends Area2D

@export var tool: DataTypes.Tools = DataTypes.Tools.None

signal hurt




func _on_area_entered(area: Area2D) -> void:
	print("ouch")
	var hit_component = area as HitComponent
	
	if tool == hit_component.tool:
		hurt.emit(hit_component.hit_damage)


func _on_damage_component_max_damaged_reached() -> void:
	pass # Replace with function body.
