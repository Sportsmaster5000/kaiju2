///Draws this object part by part.

//Draws self, allowing for flicker.
if (flicker % 2 == 0)
{
	//doll_draw(angle, bodySprite, armSprite, face, hair, undershirt, overshirt, sleeves, pants, skinColor, hairColor, undershirtColor, overshirtColor,sleevesColor, pantsColor);
	kaiju_draw();
}