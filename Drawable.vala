using Vgl;

public abstract class Vgl.Drawable : Object, Vgl.Transformable {
	public abstract void draw (RenderTarget target);
	public Vector2i position {get;set;}
	public Vector2f scale {get;set;}
	public double rotation {get;set;}
	public Vector2i origin {get;set;}
}
