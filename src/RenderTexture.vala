namespace BG {

/**
 * Represents a rendering texture, allowing creation from a file or with specified dimensions.
 */
public class RenderTexture {

	/**
     * Constructor for creating a RenderTexture from a file.
     *
     * @param file The filename of the image file to load into the RenderTexture.
     *             Supports BMP format for loading images.
     */
	public RenderTexture (string file) throws Error{
		SDL.Video.Surface? res = null;
		if (file.has_suffix (".bmp"))
			res = new SDL.Video.Surface.from_bmp (file);
		if (res == null)
			throw new BurgerError.TEXTURE_INVALID (@"Can't load $file");
		surface = (!)(owned)res;
	}

	/**
     * Constructor for creating a RenderTexture with specified dimensions.
     *
     * @param width The width of the RenderTexture.
     * @param height The height of the RenderTexture.
     */
	public RenderTexture.size (int width, int height) {
		var? res = new SDL.Video.Surface.rgb(width, height, 32, 0xff0000, 0xff00, 0xff, (uint32)0xff000000);
		assert(res != null);
		surface = (!)(owned)res;
	}

	public delegate void DrawingFunc (Cairo.Context ctx, int width, int height);
	public signal void drawing_func (Cairo.Context ctx, int width, int height);

	/**
     * Gets the SDL texture associated with this Texture.
     *
     * @param renderer The SDL renderer to create the texture on.
     * @return The SDL texture.
     */

	public SDL.Video.Texture get_texture  (RenderTarget renderer) {
		drawing_func (ctx, surface.w, surface.h);
		var? t = SDL.Video.Texture.create_from_surface(renderer._renderer, surface);
		assert(t != null);
		var texture = (!)(owned)t;
		return texture;
	}


	/**
	* Clears the content of the surface by filling the entire area with a transparent color.
	*/
	public void clear () {
		surface.fill_rect(null, 0);
	}

	/**
     * Applies color modulation to the texture.
     *
     * @param r The red component of the color.
     * @param g The green component of the color.
     * @param b The blue component of the color.
     */
	public void colorize(uint8 r, uint8 g, uint8 b) {
		surface.set_colormod (r, g, b);
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

	/**
     * Gets the width of the texture.
     */
	public int w { get {return surface.w;} }
    /**
     * Gets the height of the texture.
     */
	public int h { get {return surface.h;} }

	internal SDL.Video.Surface		surface;
	private Cairo.ImageSurface?		_cairo_surface = null;
	private Cairo.Context?			_ctx = null;
}

}
