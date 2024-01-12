namespace BG {

public class RenderTexture{

	public RenderTexture (string file) {
		SDL.Video.Surface? res;
		if (file.has_suffix (".bmp"))
			res = new SDL.Video.Surface.from_bmp (file);
		else
			error ("Can't load %s", file);
		assert (res != null);
		surface = (!)(owned)res;
	}

	public RenderTexture.size (int width, int height) {
		var? res = new SDL.Video.Surface.rgb(width, height, 32, 0xff0000, 0xff00, 0xff, (uint32)0xff000000);
		assert(res != null);
		surface = (!)(owned)res;
	}

	public delegate void DrawingFunc (Cairo.Context ctx, int width, int height);
	public signal void drawing_func (Cairo.Context ctx, int width, int height);



	public SDL.Video.Texture get_texture  (SDL.Video.Renderer renderer) {
		drawing_func (ctx, surface.w, surface.h);
		var? t = SDL.Video.Texture.create_from_surface(renderer, surface);
		assert(t != null);
		var texture = (!)(owned)t;
		return texture;
	}


	public void clear () {
		surface.fill_rect(null, 0);
	}




	public Cairo.ImageSurface cairo_surface {
		get {
			if (_cairo_surface == null)
				_cairo_surface = new Cairo.ImageSurface.for_data((uchar[])surface.pixels, Cairo.Format.ARGB32, surface.w, surface.h, surface.w * 4);
			return (!)_cairo_surface;
		}
	}
	public Cairo.Context ctx {
		get {
			if (_ctx == null)
				_ctx = new Cairo.Context(cairo_surface);
			return (!)_ctx;
		}
	}
	
	public void colorize(uint8 r, uint8 g, uint8 b) {
		surface.set_colormod (r, g, b);
	}

	public int w { get {return surface.w;} }
	public int h { get {return surface.h;} }

	public SDL.Video.Surface		surface;
	private Cairo.ImageSurface?		_cairo_surface = null;
	private Cairo.Context?			_ctx = null;

}
	
}
