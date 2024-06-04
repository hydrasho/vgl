using Vgl;

public interface Vgl.Transformable : Object {

	public abstract Vector2i position {get;set;}
	public abstract Vector2f scale {get;set;}
	public abstract double rotation {get;set;}
	public abstract Vector2i origin {get;set;}

	public void move (Vector2i offset) {
		position.x += offset.x;
		position.y += offset.y;
	}
	
	public void rotate(double angle) {
		rotation += angle;
	}
}

