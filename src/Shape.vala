namespace BG {

 /**
 * Abstract class for all Shape class 
 */
public abstract class Shape : Drawable {
	Shape(int width = 50, int height = 50, Color color = Color.White) {
		this.color = color;
		this.width = width;
		this.height = height;
		position = {0, 0};
	}

	public override void draw(SDL.Video.Renderer renderer) {
		renderer.set_draw_color (color.red, color.green, color.blue, color.alpha);
		renderer.set_scale(1.5f, 1.5f);
	}

	protected Color color;
}

/**
 * Represents a basic shape for draw a Rectangle
 */
public class RectangleShape : Shape {
	/**
     * Constructor for creating a shape with the specified width, height, and color.
     *
     * @param width The width of the shape.
     * @param height The height of the shape.
     * @param color The color of the shape (default is Color.White).
     */
	public RectangleShape(int width = 50, int height = 50, Color color = Color.White) {
		base(width, height, color);
	}
	
	public override void draw(SDL.Video.Renderer renderer) {
		base.draw(renderer);
		renderer.fill_rect ({position.x, position.y, width, height});
	}
}

}
