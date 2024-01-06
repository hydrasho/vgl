namespace BG {

 /**
 * Abstract class for all Shape class 
 */
public abstract class Shape : Drawable {
	protected Shape(int width = 50, int height = 50, Color color = Color.White) {
		base (width, height);
		this.color = color;
		_surface = new SDL.Video.Surface.rgb(width, height, 32, 0xff, 0xff00, 0xff0000, (uint32)0xff000000);
		_renderer = SDL.Video.Renderer.create_from_surface(_surface);
		_renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
		ptr_renderer = 0;
	}

	public override void draw (SDL.Video.Renderer renderer, Vector2i? pos = null) {
		if (pos == null)
			pos = {x, y};

		if (ptr_renderer != (long)&renderer) {
			_renderer.set_draw_color (color.red, color.green, color.blue, color.alpha);
			paint(_renderer, {0, 0});
			_texture = SDL.Video.Texture.create_from_surface(renderer, _surface);
			ptr_renderer = (long)&renderer;
		}
		_texture = SDL.Video.Texture.create_from_surface(renderer, _surface);
		renderer.copyex (_texture, rect, {pos.x, pos.y, width, height}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);

	}

	protected abstract void paint(SDL.Video.Renderer renderer, Vector2i? pos = null);

	public Color color;
	protected long ptr_renderer;
	private SDL.Video.Texture	_texture;
	private SDL.Video.Surface	_surface;
	private SDL.Video.Renderer	_renderer;
}
}
