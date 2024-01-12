namespace BG {

/**
* Abstract class for all Shape class
*/
public abstract class Shape : Drawable {
	protected Shape(int width, int height) {
		base (width, height);
		init_surface(width, height);
	}

	private void init_surface(int width, int height) {
		rendertexture = new RenderTexture.size(width, height);
		rendertexture.drawing_func.connect(draw_func);
		this.width = width;
		this.height = height;
	}

	/**
	* Forces the redrawing of the graphics using Cairo.
	* If new width or height is provided, it initializes the drawing surface with the new dimensions.
	*
	* @param width The new width of the drawing area (null to keep the current width).
	* @param height The new height of the drawing area (null to keep the current height).
	*/
	public void redraw (int? width = null, int? height = null) {
		if (width != null || height != null) {
			init_surface(width ?? this.width, height ?? this.height);
		}
	}

	/**
	* the drawing functionality using Cairo graphics.
	*
	* @param ctx The Cairo context for drawing operations.
	* @param width The width of the drawing area.
	* @param height The height of the drawing area.
	*/
	public virtual void draw_func(Cairo.Context ctx, int width, int height) {
		ctx.set_operator(Cairo.Operator.CLEAR);
		ctx.paint();
		ctx.set_operator(Cairo.Operator.OVER);
	}

	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null)
	{
		Vector2i p = pos ?? position;

		var texture = rendertexture.get_texture(renderer);
		renderer.copyex (texture, rect, {p.x, p.y, rect.w, rect.h}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
	}

	public RenderTexture	rendertexture;
}

}
