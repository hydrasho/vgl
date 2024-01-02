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
		base(radius, radius, color);
		this.radius = radius;
	}
	
	public override void draw(SDL.Video.Renderer renderer) {
		base.draw(renderer);
		int CX = position.x;
		int CY = position.y;

		int r2 = radius * radius;
		for (int y = -radius; y <= 0; ++y)
		{
			int y2 = y * y;
			for (int x = -radius; x <= 0; ++x)
			{
				if (x * x + y2 <= r2) {
					renderer.draw_line( CX + x, CY + y, CX - x, CY + y);
					renderer.draw_line( CX + x, CY - y, CX - x, CY - y);
					break;
				}
			}
		}
	}
	
	private int radius;
}
}
