namespace BG {

 /**
 * Abstract class for all Shape class 
 */
public abstract class Shape : Drawable {
	protected Shape(int width = 50, int height = 50, Color color = Color.White) {
		this.color = color;
		this.width = width;
		this.height = height;
		position = {0, 0};
	}

	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null) {
		renderer.set_draw_color (color.red, color.green, color.blue, color.alpha);
	}

	protected Color color;
}
}
