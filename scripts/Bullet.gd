extends RigidBody2D

var maxtime = 0.5 # adjust this in seconds

func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	self.queue_free()


