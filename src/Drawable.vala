
namespace Vgl {

public enum Flip {
	NONE = SDL.Video.RendererFlip.NONE,
	VERTICAL = SDL.Video.RendererFlip.VERTICAL,
	HORIZONTAL = SDL.Video.RendererFlip.HORIZONTAL,
}

/**
 * Represents an abstract class for objects that can be drawn.
 */
public abstract class Drawable : Object, Transformable{
	protected Drawable(int width, int height) {
		flip = NONE;
		resize(width, height);
		visible = true;
		position = {0, 0};
		_rect = null;
		angle = 0.0;
		scale = {1.0f, 1.0f};
	}

	protected void resize (int width, int height) {
		this.width = width;
		this.height = height;
	}

	 /**
     * Abstract method that must be implemented by subclasses to define how the object is drawn on the renderer.
     *
     * @param renderer The SDL renderer on which the object is drawn.
     * @param pos Optional parameter specifying the position at which to draw the object.
     */
	public abstract void draw(RenderTarget renderer, Vector2i? pos = null);

	/**
     * Gets or sets the visibility of the drawable object (default is true).
     */
	public bool visible {get;set;default=true;}

	/**
	 * the width of your entity
	 */
	public int width;
	/**
	 * the height of your entity
	 */
	public int height;

	protected Rect rect {
		get{
			if (_rect == null)
				return {0, 0, width, height};
			return (!)_rect;
		}
		set{
			_rect = value;
		}
	}
	private Rect? _rect;

	private Flip flip {get;set;}
	private Vector2f scale {get;set;}
	private double angle {get;set;}
	private Vector2i origin {get;set;}
	private Vector2i position {get;set;}
}

}
