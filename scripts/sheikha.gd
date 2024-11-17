extends Sprite2D

var lines: Array[String] = [
	"Ibn Batuta...",
	"You must visit my brother Fariduddin in India",
	"Rukonuddin in Sind,",
	"and Burhanuddin in China.",]
func _ready():
	DialogManager.start_dialog( self.position,lines)
