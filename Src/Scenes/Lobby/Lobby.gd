extends Control


#region Handlers

func _on_DisconnectButton_pressed() -> void:
	ConnectionManager.disconnect_from_server()
