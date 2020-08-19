extends Node

#region Constants
const PortNumber = 1025


#region Handlers

func _on_CreateServerButton_pressed() -> void:
	ConnectionManager.create_server()


func _on_JoinServerButton_pressed() -> void:
	var ip = get_node('IpField').text
	ConnectionManager.join_server(ip)
