namespace BG {

	public class RenderTarget {
		public RenderTarget.from_texture(RenderTexture texture) {
			var? renderer = SDL.Video.Renderer.create_from_surface(texture.surface);
			assert(renderer != null);
			_renderer = (!)(owned)renderer;
			_renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
			w = texture.w;
			h = texture.h;
		}
		public RenderTarget.from_window(SDL.Video.Window window, int index, uint32 flags) {
			var? renderer = SDL.Video.Renderer.create(window, index, flags);
			assert(renderer != null);
			_renderer = (!)(owned)renderer;
			window.get_size (out w, out h);
		}
		
		public void clear(Color color = Color.White) {
			_renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
			_renderer.fill_rect ({0, 0, w, h});
		}
		
		public void copy (SDL.Video.Texture texture, Rect? srcrect, Rect? dstrect, double angle, Vector2i origin, BG.Flip flip) {
			_renderer.copyex(texture, srcrect, dstrect, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
		}
		public void present() {
			_renderer.present();
		}
		
		private int w;
		private int h;
		internal SDL.Video.Renderer	_renderer;
	}
}
