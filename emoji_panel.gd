@tool
extends PanelContainer

signal emoji_pressed(emoji_code: String)

const EMOJI_PATH := "res://addons/blazium_emoji_editor/emoji/%s.svg"


var emoji_list := {
	":love:": EMOJI_PATH % "love",
	":kiss:": EMOJI_PATH % "kiss",
	":cold:": EMOJI_PATH % "cold",
	":zzz:": EMOJI_PATH % "sleep",
	":hmm:": EMOJI_PATH % "hmm",
	":ok:": EMOJI_PATH % "ok",
	"o-o": EMOJI_PATH % "erm",
	">_<": EMOJI_PATH % "scarey",
	"O:)": EMOJI_PATH % "angel",
	">:(": EMOJI_PATH % "angry",
	":-/": EMOJI_PATH % "bored",
	"o_O": EMOJI_PATH % "blank",
	">:)": EMOJI_PATH % "devil",
	":=(": EMOJI_PATH % "cry",
	":'(": EMOJI_PATH % "tear",
	":'D": EMOJI_PATH % "tears",
	"*_*": EMOJI_PATH % "stars",
	"-_-": EMOJI_PATH % "shifty",
	"';D": EMOJI_PATH % "nervous",
	"':D": EMOJI_PATH % "happy_nervous",
	".-.": EMOJI_PATH % "upside",
	"':|": EMOJI_PATH % "sly",
	":|": EMOJI_PATH % "big_frown",
	"<3": EMOJI_PATH % "heart",
	":D": EMOJI_PATH % "excited",
	":(": EMOJI_PATH % "sad",
	"xD": EMOJI_PATH % "laugh",
	";D": EMOJI_PATH % "happy_laugh",
	":)": EMOJI_PATH % "smile",
	":]": EMOJI_PATH % "happy_smile",
	"8)": EMOJI_PATH % "glasses",
	":3": EMOJI_PATH % "cat",
	":!": EMOJI_PATH % "sick",
	":*": EMOJI_PATH % "smooch",
	":P": EMOJI_PATH % "tongue",
	":o": EMOJI_PATH % "confused",
	":z": EMOJI_PATH % "unsure",
	":?": EMOJI_PATH % "what",
	"xZ": EMOJI_PATH % "frazzled",
	"xP": EMOJI_PATH % "dead",
	"x|": EMOJI_PATH % "dead_over",
	":#": EMOJI_PATH % "injured",
	"$D": EMOJI_PATH % "money",
	":[": EMOJI_PATH % "scared",
	";)": EMOJI_PATH % "wink",
	"3(": EMOJI_PATH % "shame",
	":8": EMOJI_PATH % "open_mouth",
	":x": EMOJI_PATH % "silent",
	":<": EMOJI_PATH % "frown",
	"3)": EMOJI_PATH % "proud",
}


func get_final_text(text: String) -> String:
	if text.is_empty():
		return text
	for emoji in emoji_list:
		var code = "[img]%s[/img]" % emoji_list[emoji]
		text = text.replace(emoji, code)
	return text


func _init() -> void:
	var grid := GridContainer.new()
	grid.columns = 10
	add_child(grid)
	for emoji in emoji_list:
		var emoji_button := Button.new()
		emoji_button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		emoji_button.theme_type_variation = "EmojiButton"
		emoji_button.icon = load(emoji_list[emoji])
		emoji_button.pressed.connect(_emoji_pressed.bind(emoji))
		grid.add_child(emoji_button)


func _emoji_pressed(emoji: String):
	emoji_pressed.emit(emoji)
