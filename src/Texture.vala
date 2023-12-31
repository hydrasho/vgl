namespace BG {

public class Texture {
	public Texture(string filename) throws Error {
		texture = null;
		surface = new SDL.Video.Surface.from_bmp(filename);
		if (surface == null)
			throw new ColumnsError.TEXTURE_INVALID(@"Can't load $filename");
	}
	
	public unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer) {
		if (texture == null) {
			texture = SDL.Video.Texture.create_from_surface(renderer, surface);
		}
		return (!)texture;
	}

	public void colorize(uint8 r, uint8 g, uint8 b) {
		surface.set_colormod (r, g, b);
	}

	public int width {get{return surface.w;}}
	public int height {get {return surface.h;}}
	private SDL.Video.Surface surface;
	private SDL.Video.Texture? texture;
}
}
