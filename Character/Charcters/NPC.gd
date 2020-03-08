extends "res://Character/Charcters/Characters.gd"


onready var dialog = get_node("CanvasLayer/DialogBox")

var num
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _dialogs():
	num = rand_range(0,5)
	global.is_talkable=false
	print(bool(global.is_talkable),"Character 1")
	dialog.set_visible(true)
	print("character 1")
	if global.is_present(global.event_collection,'Event_1'):
		dialog.get_node("Text").set_bbcode(dialog.NPC_dialog[num])
		dialog.get_node("Text").set_visible_characters(0)
	else:
		print("OKAYY...")
		dialog.get_node("Text").set_bbcode("Chaos")
		print("character 1")
	c= global.is_present(global.people_talked_collection,"NPC")
	if not c:
		global.people_talked_collection.append("NPC")


func _on_Area2D_body_entered(body):
	if body is Player:
		global.is_inside_area=true
		global.is_talkable=true
		print(global.is_talkable,"Area Entered")
		global.area_entered_name=str(self.name)
		print(global.area_entered_name)


func _on_Area2D_body_exited(body):
	if body is Player:
		global.is_inside_area = false
		global.is_talkable=false
		print(global.is_talkable," is talkable Area Exited")
		global.area_entered_name="No area entered"
		dialog.set_visible(false)
