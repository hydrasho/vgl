
namespace BG {

public enum Flip {
	NONE = SDL.Video.RendererFlip.NONE,
	VERTICAL = SDL.Video.RendererFlip.VERTICAL,
	HORIZONTAL = SDL.Video.RendererFlip.HORIZONTAL,
}


/**
 * Represents an abstract class for objects that can be drawn.
 */
public abstract class Drawable : Object{
	protected Drawable(int width, int height) {
		flip = NONE;
		this.width = width;
		this.height = height;
		visible = true;
		position = {0, 0};
		_rect = null;
		angle = 0.0;
		scale = {1.0f, 1.0f};
	}

	 /**
     * Abstract method that must be implemented by subclasses to define how the object is drawn on the renderer.
     *
     * @param renderer The SDL renderer on which the object is drawn.
     * @param pos Optional parameter specifying the position at which to draw the object.
     */
	public abstract void draw(SDL.Video.Renderer renderer, Vector2i? pos = null);

	/**
     * Moves the object by the specified offset in the x and y directions.
     *
     * @param x The offset to move the object in the x direction.
     * @param y The offset to move the object in the y direction.
     */
	public void move (int x, int y) {
		this.x += x;
		this.y += y;
	}



	public void rescale(Vector2f scale) {
		this.scale = {scale.x + scale.x, scale.y + scale.y};
	}

	public Vector2f scale {get;set;}

	/**
     * Gets or sets the visibility of the drawable object (default is true).
     */
	public bool visible {get;set;default=true;}

	/**
     * Gets or sets the x-coordinate of the drawable object's position.
     */
    public int x {
        get { return position.x; }
        set { position.x = value; }
    }

    /**
     * Gets or sets the y-coordinate of the drawable object's position.
     */
    public int y {
        get { return position.y; }
        set { position.y = value; }
    }

    /**
     * The drawable object's position.
     */
	public Vector2i position;

	/**
	 * the width of your entity
	 */
	public int width;
	/**
	 * the height of your entity
	 */
	public Flip flip;
	public int height;
	public Vector2i origin;

	protected Rect rect {
		get{
			if (_rect == null)
				return {0, 0, width, height};
			return _rect;
		}
		set{
			_rect = value;
		}
	}
	private Rect? _rect;

	public double angle {get;set;}
}

}
