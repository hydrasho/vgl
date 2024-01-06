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
		base(radius * 2, radius * 2, color);
		this.radius = radius;
	}

	protected override void paint(SDL.Video.Renderer renderer, Vector2i? pos = null){
		if (pos == null)
			pos = position;

		int CX = pos.x + (int)width / 2;
		int CY = pos.y + (int)height / 2;

		int r2 = radius * radius;
		for (int y = -radius; y <= 0; ++y)
		{
			int y2 = y * y;
			for (int x = -radius; x <= 0; ++x)
			{
				if (x * x + y2 <= r2) {
					renderer.draw_line( CX + x, CY + y, CX - x, CY + y);
					if (y != 0)
						renderer.draw_line( CX + x, CY - y, CX - x, CY - y);
					break;
				}
			}
		}
	}
	
	private int radius;
}
}
