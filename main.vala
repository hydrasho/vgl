using Vgl;

void main()
{
	var win = new Vgl.RenderWindow("Hello", {0, 0}, {500, 500}, RESIZABLE);
	var texture = new Vgl.Texture("./pouce.bmp");
	var sprite = new Vgl.Sprite(texture);

	sprite.origin = {texture.width / 2, texture.height / 2};
	sprite.position.x = 200;
	sprite.position.y = 100;
	SDL.Event event;

	while (win.is_open) {
		SDL.Event.poll(out event);

		sprite.rotation += 0.2;

		if (event.type == SDL.EventType.QUIT)
			break;
		win.clear();
		win.draw(sprite);
		win.display();
	}
	
}
