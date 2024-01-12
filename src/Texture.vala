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
	public Texture(string filename) {
		rendertexture = new RenderTexture(filename);
	}
	
	/**
     * Gets the SDL texture associated with this Texture.
     *
     * @param renderer The SDL renderer to create the texture on.
     * @return The SDL texture.
     */
	public SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer) {
		return rendertexture.get_texture (renderer);
	}

	/**
     * Applies color modulation to the texture.
     *
     * @param r The red component of the color.
     * @param g The green component of the color.
     * @param b The blue component of the color.
     */
	public void colorize(uint8 r, uint8 g, uint8 b) {
		rendertexture.colorize(r, g, b);
	}

	/**
     * Gets the width of the texture.
     */
    public int width {
        get { return rendertexture.w; }
    }

    /**
     * Gets the height of the texture.
     */
    public int height {
        get { return rendertexture.h; }
    }

	public Color color {
		get {
			return _color;
		}
		set {
			_color = value;
			this.colorize (_color.red, _color.green, _color.blue);
		}
	}
	private Color _color = {255, 255, 255};

	// private long				_ptr_renderer;
	private RenderTexture		rendertexture;
}
}
