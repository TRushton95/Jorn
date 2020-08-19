extends Node

#region Constants
const PORT_NUMBER = 1025


#Methods
func create_server() -> void:
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(PORT_NUMBER, 2)
	get_tree().network_peer = peer
	_switch_to_lobby()
	
	
func join_server(ip_address) -> void:
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip_address, PORT_NUMBER)
	print('connected to ' + ip_address)
	get_tree().network_peer = peer
	_switch_to_lobby()
	
	
func disconnect_from_server() -> void:
	get_tree().network_peer = null
	_switch_to_login()
	
	
func _switch_to_lobby() -> void:
	var lobby = load("res://Scenes/Lobby/Lobby.tscn").instance()
	get_tree().get_root().add_child(lobby)
	get_tree().get_root().get_node('Login').hide()


func _switch_to_login() -> void:
	get_tree().get_root().get_node('Lobby').queue_free()
	get_tree().get_root().get_node('Login').show()
