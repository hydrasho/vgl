namespace BG {
/**
	* Represents a circle shape, inheriting from the Shape class.
	*/
public class EllipseShape : Shape {
	/**
	* Constructor for creating a Ellipse shape with the specified radius and color.
	*
	* @param width The semi-width of the ellipse.
	* @param height The semi-height of the ellipse.
	* @param color The ellipse color (default is Color.White).
	*/
	public EllipseShape(int width, int height, Color color = Color.White) {
		base(width, height, color);
	}

	public override void draw(SDL.Video.Renderer renderer) {
		base.draw(renderer);
		int CX = position.x;
		int CY = position.y;
		int	h = (int)height;
		int w = (int)width;

		for (int y = -h; y <= 0; ++y)
		{
			double y_part = Math.pow(y, 2) / Math.pow(h, 2);
			for (int x = -w; x <= 0; ++x)
			{
				double x_part = Math.pow(x, 2) / Math.pow(w, 2);
				if (x_part + y_part <= 1.0) {
					renderer.draw_line( CX + x, CY + y, CX - x, CY + y);
					renderer.draw_line( CX + x, CY - y, CX - x, CY - y);
					break;
				}
			}
		}
	}
}
}
