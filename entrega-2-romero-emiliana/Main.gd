extends Node

onready var player:Sprite = $Player

onready var turret:Sprite = $Turret

func _ready():
	player.set_projectile_container(self)
	turret.set_values(player, self)
