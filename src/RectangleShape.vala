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
		base(width, height);
		_color = color;
	}

	public override void draw_func(Cairo.Context ctx, int width, int height) {
		base.draw_func(ctx, width, height);
		ColorDouble c = ColorDouble.parse(color);

		ctx.set_source_rgba(c.r, c.g, c.b, c.a);
		ctx.rectangle(position.x, position.y, width, height);
		ctx.paint();
	} 

	private Color _color;
	public Color color {get {return _color;}
		set {
			_color = value;
			base.redraw();
		}
	}
}

}
