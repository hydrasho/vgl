using Vgl;

public class Vgl.RenderTarget : Object {
	protected RenderTarget(){

	}

	protected void create_from_window(SDL.Video.Window window, int index, uint32 flags) {
		renderer = SDL.Video.Renderer.create(window, index, flags);
		renderer.render_target = SDL.Video.Texture.create(renderer, SDL.Video.PixelRAWFormat.ARGB8888, SDL.Video.TextureAccess.TARGET, width, height);
		window.get_size(out width, out height);
	}
	
	protected void create_from_surface(SDL.Video.Surface surface) {
		renderer = SDL.Video.Renderer.create_from_surface(surface);
		renderer.render_target = SDL.Video.Texture.create(renderer, SDL.Video.PixelRAWFormat.ARGB8888, SDL.Video.TextureAccess.TARGET, width, height);
		width = surface.w;
		height = surface.h;
	}

	public void clear (Color? color = null) {
		renderer.clear ();
		if (color != null) {
			renderer.set_draw_color (color.red, color.green, color.blue, color.alpha);
			renderer.fill_rect ({0, 0, width, height});
			renderer.set_draw_color (0, 0, 0 ,0);
		}
	}

	public void display() {
		renderer.present();
	}

	public void draw (Drawable drawable) {
		drawable.draw(this);
	}

	public Vector2f scale {
		get {
			Vector2f result = {};
			renderer.get_scale (out result.x, out result.y);
			return result;
		}
		set {
			renderer.set_scale ((float)value.x, (float)value.y);
		}
	}
	
	public Vector2i logical_size{
		get {
			Vector2i result = {};
			renderer.get_logical_size(out result.x, out result.y);
			return result;
		}
		set {
			renderer.set_logical_size(value.x, value.y);
		}
	}

	internal SDL.Video.Renderer renderer;
	private int width;
	private int height;
}
