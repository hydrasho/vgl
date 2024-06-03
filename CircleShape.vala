using Vgl;

public class Vgl.CircleShape : Shape {
	public CircleShape (double radius = 25.0, Color color = Color.Red) {
		this._radius = radius;
		this._color = color;
		int r = (int)(radius * 2.0);
		alloc_size (r, r);
		cairo_draw_func ();	
	}

	protected override void cairo_draw_func () {
		base.cairo_draw_func ();
		ctx.set_source_rgba(_color.red / 255.0, _color.green / 255.0, _color.blue/ 255.0, _color.alpha / 255.0);
		ctx.arc(_radius, _radius, _radius, 0, 2.0 * Math.PI);
		ctx.fill();
	}

	/* Property */
	private Color _color;
	public Color color {
		get {
			return _color;
		}
		set {
			bool redraw = false;
			if (_color != value)
				redraw = true;
			_color = value;
			if (redraw)
				cairo_draw_func ();
		}
	}

	private double _radius;
	public double radius {
		get {
			return _radius;
		}
		set {
			bool redraw = false;
			if (_radius != value)
				redraw = true;

			_radius = value;
			int r = (int)(value * 2.0);
			if (redraw) {
				alloc_size (r, r);
				cairo_draw_func ();	
			}
		}
	}
}
