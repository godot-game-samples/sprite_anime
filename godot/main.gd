extends Node2D

@onready var anim_sprite := $AnimatedSprite2D
@onready var dropdown := $Control/OptionButton

func _ready():
	anim_sprite.visible = false
	dropdown.connect("item_selected", _on_item_selected)

func _on_item_selected(index):
	var anim_name = dropdown.get_item_text(index)
	anim_sprite.visible = true
	anim_sprite.sprite_frames.set_animation_loop(anim_name, false)
	anim_sprite.play(anim_name)

	await anim_sprite.animation_finished
	anim_sprite.visible = false
