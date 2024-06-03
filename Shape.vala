using Vgl;

public abstract class Vgl.Shape : Transformable, Drawable {
	protected Shape () {
		real_size = {0, 0, 0, 0};
		width_max = 0;
		height_max = 0;
	}

	void draw (RenderTarget target) {
		unowned var t = texture[target];
		if (t.need_update) {
			t.texture.update (real_size, texture.surface.pixels, texture.surface.pitch);
			t.need_update = false;
		}
		target.renderer.copyex(texture[target].texture, real_size, {position.x, position.y, real_size.w, real_size.h}, rotation, {origin.x, origin.y}, SDL.Video.RendererFlip.NONE);
	}

	protected void alloc_size (int width, int height) {
		bool need_upscale = false;
		if (width > width_max) {
			width_max = width;
			need_upscale = true;
		}
		if (height > height_max) {
			need_upscale = true;
			height_max = width;
		}
		if (need_upscale) {
			texture = new Texture.from_size(width_max, height_max);
			unowned var surface = texture.surface;
			cairosurface = new Cairo.ImageSurface.for_data((uchar[])surface.pixels, Cairo.Format.ARGB32, surface.w, surface.h, surface.w * 4);
			ctx = new Cairo.Context(cairosurface);
		}
		real_size.w = width;
		real_size.h = height;

	}
	
	protected virtual void cairo_draw_func () {
		/* Clear the surface with full transparency */
		ctx.set_operator (Cairo.Operator.CLEAR);
		ctx.paint();
		ctx.set_operator (Cairo.Operator.OVER);
		texture.update_all ();
	}

	public uint width {get { return real_size.w; }}
	public uint height {get { return real_size.h; }}

	private Rect real_size;
	private int width_max;
	private int height_max;
	private Rect textureRect {get; set;}
	protected Cairo.ImageSurface cairosurface;
	protected Cairo.Context ctx;
	protected Texture texture;
}
