namespace BG {

public class Shape : Drawable {
	public Shape(int width = 50, int height = 50, Color color = Color.White) {
		this.color = color;
		rect = {0, 0, width, height};
		position = {0, 0};
	}

	public override void draw(SDL.Video.Renderer renderer) {
		renderer.set_draw_color (color.red, color.green, color.blue, color.alpha);
		renderer.set_scale(1.5f, 1.5f);
	}

	protected Color color;
}

public class RectangleShape : Shape {
	public RectangleShape(int width = 50, int height = 50, Color color = Color.White) {
		base(width, height, color);
	}
	
	public override void draw(SDL.Video.Renderer renderer) {
		base.draw(renderer);
		renderer.fill_rect (rect);
	}
}

}
