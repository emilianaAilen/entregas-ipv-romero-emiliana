extends Sprite

export (PackedScene) var projectile_scene:PackedScene

var player:Sprite

var projectile_container:Node

onready var fire_position:Position2D = $FirePosition

onready var timer:Timer = $Timer

func set_values(player, projectile_container):
	self.player = player
	self.projectile_container = projectile_container
	timer.start()
	

func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.connect("delete_requested", self, "_on_projectile_delete_requested")
	
func _on_projectile_delete_requested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
	
