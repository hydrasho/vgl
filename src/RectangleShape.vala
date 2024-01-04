namespace BG {
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
	
	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null) {
		if (pos == null)
			pos = position;
		base.draw(renderer);
		renderer.fill_rect ({pos.x, pos.y, width, height});
	}
}

}
