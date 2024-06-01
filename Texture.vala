using Vgl;

public class Vgl.Texture{
	public class Texture(string file) {
		this.from_bmp(file);
	}

	public class Texture.from_bmp(string file) {
		textures = new HashTable<unowned RenderTarget, SDL.Video.Texture>(null, null);
		surface = new SDL.Video.Surface.from_bmp(file);
	}
	public class Texture.from_size(int width, int height) {
		textures = new HashTable<unowned RenderTarget, SDL.Video.Texture>(null, null);
		surface = new SDL.Video.Surface.rgb_with_format(width, height, 32, SDL.Video.PixelRAWFormat.RGBA8888);
	}
	
	public unowned SDL.Video.Texture get(RenderTarget target) {
		if (!(target in textures)) {
			var tmp = SDL.Video.Texture.create_from_surface(target.renderer, surface);
			textures[target] = (owned)tmp; 
		}
		return textures[target];
	}

	/* Property */
	public int width {get {return surface.w;}}
	public int height {get {return surface.h;}}
	private HashTable<unowned RenderTarget, SDL.Video.Texture> textures;
	private SDL.Video.Surface surface;
}

