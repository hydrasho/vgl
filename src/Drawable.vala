
namespace BG {

/**
 * Represents an abstract class for objects that can be drawn.
 */
public abstract class Drawable {
	public abstract void draw(SDL.Video.Renderer renderer);

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
	public uint width;
	/**
	 * the height of your entity
	 */
	public uint height;
}

}
