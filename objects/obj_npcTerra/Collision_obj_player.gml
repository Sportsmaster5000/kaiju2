/// @description Collision with player makes the npc spawn the speech balloon.
if !instance_exists(myBalloon)
{
	myBalloon = npc_speak(text);
}