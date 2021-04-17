/// @description NPC speech.
if !(instance_exists(myBalloon)) && (text != "")
{
	myBalloon = npc_speak(text);
}