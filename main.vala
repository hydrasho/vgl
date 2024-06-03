using Vgl;

void main()
{
	var win = new Vgl.RenderWindow("Hello", {0, 0}, {500, 500}, RESIZABLE);
	var texture = new Vgl.Texture("./pouce.bmp");
	// texture.set_cliprect({18, 0, 0, 0});
	var sprite = new Vgl.Sprite(texture);
	var circle = new CircleShape(100.0);
	var rect = new RectangleShape();
	// rect.color = {55, 90, 20, 155};
	
	var text = new Text("Hello", 50);
	text.position.x = 20;
	text.position.y = 20;

	SDL.Event event;

	while (win.is_open) {
		SDL.Event.poll(out event);

		if (event.type == SDL.EventType.QUIT)
			break;
		if (event.type == SDL.EventType.KEYUP) {
			if (event.key.keysym.sym.get_name() == "Down")
			{
				print("YES\n");
				circle.color = {200, 255, 0, 255};
				circle.radius--;
				rect.set_size({rect.width - 10, rect.height - 10});
			}
			if (event.key.keysym.sym.get_name() == "Up")
			{
				print("YES\n");
				circle.color = {200, 255, 0, 255};
				circle.radius++;
				rect.color = {0, 25, 20, 255};
				rect.set_size({rect.width + 10, rect.height + 10});
			}

		}
		win.clear();
		win.draw(sprite);
		win.draw(circle);
		win.draw(text);
		win.draw(rect);
		win.display();
	}
	
}
