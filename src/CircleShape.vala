namespace BG {
/**
 * Represents a circle shape, inheriting from the Shape class.
 */
public class CircleShape : Shape {
    /**
     * Constructor for creating a circle shape with the specified radius and color.
     *
     * @param radius The radius of the circle.
     * @param color The color of the circle (default is Color.White).
     */
	public CircleShape(int radius, Color color = Color.White) {
		base(radius * 2, radius * 2);
		_color = color;
		_radius = radius;
	}
	
	public override void draw_func(Cairo.Context ctx, int width, int height) {
		ColorDouble c = ColorDouble.parse(_color);
		base.draw_func(ctx, width, height);

		ctx.set_source_rgba(c.r, c.g, c.b, c.a);
		ctx.arc(width/2.0 , height / 2.0, radius, 0, 2.0 * Math.PI);
		ctx.fill();
	} 

	
	private int _radius;
	public int radius {
		get {
			return _radius;
		}
		set {
			_radius = value;
			base.redraw(value *2, value *2);
		}
	}
	private Color _color;
	public Color color {get {return _color;}
		set {
			_color = value;
			base.redraw();
		}}
}
}
