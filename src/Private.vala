namespace BG {

public class RendererTexture {
	public RendererTexture (SDL.Video.Surface surface) {
		_renderer = (!)SDL.Video.Renderer.create_from_surface (surface);
		_renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
	}
	
	public RendererTexture.from_window (SDL.Video.Window window, int index, uint32 flags) {
		_renderer = (!)SDL.Video.Renderer.create(window, index, flags);

	}

	~RendererTexture () {
		onDestroy();
	}
			
	public void copy (SDL.Video.Texture texture, Rect srcrect, Rect dstrect, double angle, Vector2i center, BG.Flip flip) {
		_renderer.copyex (texture, srcrect, dstrect, angle, {center.x, center.y}, (SDL.Video.RendererFlip) flip);
	}

	public signal void onDestroy ();

	public SDL.Video.Renderer _renderer;
}

}
