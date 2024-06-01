using Vgl;

public class Vgl.Transformable {
	public Vector2i position;
	public Vector2f scale;
	public double rotation;
	public Vector2i origin;

	public void move (Vector2i offset) {
		print("MOVE %d %d\n", position.x, position.y);
		position.x += offset.x;
		position.y += offset.y;
	}
	
	public void rotate(double angle) {
		rotation += angle;
	}
}

