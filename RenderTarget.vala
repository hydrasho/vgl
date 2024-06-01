using Vgl;

public class Vgl.RenderTarget {
	protected RenderTarget(){

	}
	protected void create_from_window(SDL.Video.Window window, int index, uint32 flags) {
		renderer = SDL.Video.Renderer.create(window, index, flags);
		window.get_size(out width, out height);
	}

	public void clear () {
		renderer.clear ();
	}

	public void display() {
		renderer.present();
	}

	public void draw (Drawable drawable) {
		drawable.draw(this);
	}

	public unowned SDL.Video.Texture get_texture() {
		return renderer.render_target;
	}

	// TODO internal
	public SDL.Video.Renderer renderer;
	private int width;
	private int height;
}
