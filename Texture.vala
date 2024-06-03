using Vgl;

public class Vgl.Texture{
	public class Texture(string file) {
		this.from_bmp(file);
	}

	public class Texture.from_bmp(string file) {
		textures = new HashTable<unowned RenderTarget, UTexture>(null, null);
		surface = new SDL.Video.Surface.from_bmp(file);
	}

	public class Texture.from_size(int width, int height) {
		textures = new HashTable<unowned RenderTarget,UTexture>(null, null);
		surface = new SDL.Video.Surface.rgb_with_format(width, height, 32, SDL.Video.PixelRAWFormat.ARGB8888);
	}


	public void setColor (Color color) {
		surface.set_colormod (color.red, color.green, color.blue);
	}
	
	public void setAlpha (uint8 alpha) {
		surface.set_alphamod (alpha);
	}
	
	public Color getColor () {
		uint8 r,g,b;
		surface.get_colormod (out r, out g, out b);
		return ({r, g, b});
	}
	
	public uint8 getAlpha () {
		uint8 a;
		surface.get_alphamod (out a);
		return a;
	}

	public bool set_cliprect (Rect? rect = null) {
		Rect _rect;
		if (rect == null)
			_rect = {0, 0, surface.w, surface.h};
		else
			_rect = rect;
		return surface.set_cliprect (rect);
	}

	internal unowned UTexture get(RenderTarget target) {
		if (!(target in textures)) {
			var tmp = SDL.Video.Texture.create_from_surface(target.renderer, surface);
			textures[target] = new UTexture((owned)tmp); 
		}
		return textures[target];
	}

	public void update_all() {
		textures.foreach ((k, v)=> {
			v.need_update = true;
		});
	}


	public void save_bmp (string file_path) {
		SDL.RWops *rops = new SDL.RWops.from_file (file_path, "wb");
		surface.save_bmp_rw (rops, 1);
	}


	/* Property */
	public int width {get {return surface.w;}}
	public int height {get {return surface.h;}}


	/* Private */
	private HashTable<unowned RenderTarget, UTexture> textures;
	public SDL.Video.Surface surface;
}

[Compact]
internal class Vgl.UTexture {
	public UTexture (owned SDL.Video.Texture texture) {
		this.texture = (owned)texture;
		need_update = false;
	}

	internal SDL.Video.Texture texture;
	internal bool need_update;
}
