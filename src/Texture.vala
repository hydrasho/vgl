namespace BG {

/**
 * Represents a texture for graphical elements.
 */
public class Texture : RenderTexture {
	/**
     * Constructor for creating a Texture from a file.
     *
     * @param filename The filename of the image file to load.
     * @throws Error Throws an error if the texture cannot be loaded.
     */
	public Texture(string filename) throws Error {
		base (filename);
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
}
}
