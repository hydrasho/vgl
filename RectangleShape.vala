using Vgl;
/**
 * Represents a basic shape for draw a Rectangle
 */
public class Vgl.RectangleShape : Shape {
	/**
     * Constructor for creating a shape with the specified width, height, and color.
     *
     * @param width The width of the shape.
     * @param height The height of the shape.
     * @param color The color of the shape (default is Color.White).
     */
	public RectangleShape(int width = 50, int height = 50, Color color = Color.White) {
		_color = color;
		alloc_size (width, height);
		cairo_draw_func ();
	}

	protected override void cairo_draw_func () {
		base.cairo_draw_func ();

		ctx.set_source_rgba(_color.red / 255.0, _color.green / 255.0, _color.blue / 255.0, _color.alpha / 255.0);
		ctx.rectangle(position.x, position.y, width, height);
		ctx.fill();
	} 



	public void set_size (Vector2u size) {
		alloc_size ((int)size.x, (int)size.y);
		cairo_draw_func ();
	}
	
	public Vector2u get_size () {
		return {width, height};
	}


	private Color _color;
	public Color color {get {return _color;}
		set {
			bool redraw = false;
			if (_color != value)
				redraw = true;
			_color = value;
			if (redraw)
				cairo_draw_func ();
		}
	}
}

