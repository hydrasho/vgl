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
		var? surface = new SDL.Video.Surface.rgb(width, height, 32, 0xff0000, 0xff00, 0xff, (uint32)0xff000000);
		assert(surface != null);
		_surface = (!)(owned)surface;
		cairo_surface = new Cairo.ImageSurface.for_data((uchar[])_surface.pixels, Cairo.Format.ARGB32, width, height, width * 4);
		ctx = new Cairo.Context(cairo_surface);
		this.width = width;
		this.height = height;
		ptr_renderer = 0;
	}

	/**
	* the drawing functionality using Cairo graphics.
	*
	* @param ctx The Cairo context for drawing operations.
	* @param width The width of the drawing area.
	* @param height The height of the drawing area.
	*/
	public virtual signal void draw_func(Cairo.Context ctx, int width, int height) {
		ctx.set_operator(Cairo.Operator.CLEAR);
		ctx.paint();
		ctx.set_operator(Cairo.Operator.OVER);
	}

	/**
	* Forces the redrawing of the graphics using Cairo.
	* If new width or height is provided, it initializes the drawing surface with the new dimensions.
	*
	* @param width The new width of the drawing area (null to keep the current width).
	* @param height The new height of the drawing area (null to keep the current height).
	*/
	public void redraw(int? width = null, int? height = null) {
		if (width != null || height != null) {
			init_surface(width ?? this.width, height ?? this.height);
		}
		ptr_renderer = 0;
	}

	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null)
	{
		Vector2i p = pos ?? position;

		ptr_renderer = (size_t)&renderer;
		draw_func(ctx, width, height);
		if (ptr_renderer != (size_t)&renderer) {
			draw_func(ctx, width, height);
			ptr_renderer = (size_t)&renderer;
		}
		var? texture = SDL.Video.Texture.create_from_surface(renderer, _surface);
		assert(texture != null);
		_texture = (!)(owned)texture;

		renderer.copyex (_texture, rect,{p.x, p.y, rect.w, rect.h}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
	}

	private size_t						ptr_renderer;
	protected Cairo.Context				ctx;
	protected Cairo.ImageSurface		cairo_surface;
	protected SDL.Video.Surface			_surface;
	private SDL.Video.Texture			_texture;
}

}
