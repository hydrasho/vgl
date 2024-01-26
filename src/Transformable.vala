namespace Vgl {




public interface Transformable {
	/**
     * Gets or sets the x-coordinate of the drawable object's position.
     */
    public virtual int x {
        get { return position.x; }
        set { position.x = value; }
    }

    /**
     * Gets or sets the y-coordinate of the drawable object's position.
     */
    public virtual int y {
        get { return position.y; }
        set { position.y = value; }
    }

	/**
	* rescaling an object.
	*
	* @param scale A vector representing the scaling factors along the x and y axes.
	*/
	public virtual void rescale(Vector2f scale) {
		this.scale = {scale.x + scale.x, scale.y + scale.y};
	}

	/**
     * Moves the object by the specified offset in the x and y directions.
     *
     * @param x The offset to move the object in the x direction.
     * @param y The offset to move the object in the y direction.
     */
	public virtual void move (int x, int y) {
		this.position.x += x;
		this.position.y += y;
	}

	public abstract Flip flip {get;set;}
	public abstract Vector2f scale {get;set;}
	public abstract double angle {get;set;}
	public abstract Vector2i origin {get;set;}
	public abstract Vector2i position {get;set;}
}




}
