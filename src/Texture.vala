namespace BG {

/**
 * Represents a texture for graphical elements.
 */
public class Texture {
	/**
     * Constructor for creating a Texture from a file.
     *
     * @param filename The filename of the image file to load.
     * @throws Error Throws an error if the texture cannot be loaded.
     */
	public Texture(string filename) throws Error {
		texture = null;
		surface = new SDL.Video.Surface.from_bmp(filename);
		if (surface == null)
			throw new ColumnsError.TEXTURE_INVALID(@"Can't load $filename");
	}
	
	/**
     * Gets the SDL texture associated with this Texture.
     *
     * @param renderer The SDL renderer to create the texture on.
     * @return The SDL texture.
     */
	public unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer) {
		if (texture == null) {
			texture = SDL.Video.Texture.create_from_surface(renderer, surface);
		}
		return (!)texture;
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

	/**
     * Gets the width of the texture.
     */
    public int width {
        get { return surface.w; }
    }

    /**
     * Gets the height of the texture.
     */
    public int height {
        get { return surface.h; }
    }

	private SDL.Video.Surface surface;
	private SDL.Video.Texture? texture;
}
}
