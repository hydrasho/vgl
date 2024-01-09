namespace BG {

/**
 * Represents a layer where drawable element can be draw
 *
 * How draw an Object in the layer ?
 * Example:
 * {{{
 * 	var circle = new CircleShape(50, Color.Red);
 * 	var rect = new RectangleShape(50, 60, Color.White);
 * 	var layer = new Layer(100, 100);
 * 	
 * 	layer.paint(circle);
 * 	layer.paint(rect, {15, 12});
 * 	
 * 	while (win.is_open) {
 * 		win.clear();
 * 		win.draw(layer);
 * 		win.present();
 * 	}
 * }}}
 */
public class Layer : Drawable {
	/**
     * Constructor for creating a layer with the specified width and height.
     *
     * @param width The width of the layer.
     * @param height The height of the layer.
     */
	public Layer (int width, int height) {
		base(width, height);
		var? surface = new SDL.Video.Surface.rgb(width, height, 32, 0xff, 0xff00, 0xff0000, (uint32)0xff000000);
		assert(surface != null);
		_surface = (!)(owned)surface;
		
		var? renderer = SDL.Video.Renderer.create_from_surface(_surface);
		assert(renderer != null);
		_renderer = (!)(owned)renderer;
		_renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
		_ptr_renderer = 0;
	}

	/**
	* Paints a drawable object onto the current layer's renderer at the specified position.
	*
	* @param drawable The drawable object to be painted.
	* @param pos Optional parameter specifying the position at which to paint the drawable object.
	*/
	public void paint(Drawable drawable, Vector2i? pos = null) {
		if (pos == null)
			pos = drawable.position;
		drawable.draw(_renderer, pos);
		_ptr_renderer = 0;
	}

	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null) {
		Vector2i p = pos ?? position;
		if (_ptr_renderer != (long)&renderer) {
			_ptr_renderer = (long)&renderer;
			var? texture = SDL.Video.Texture.create_from_surface(renderer, _surface);
			assert(texture != null);
			_texture = (!)(owned)texture;
		}
		renderer.copyex(_texture, rect, {p.x, p.y, rect.w, rect.h}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
	}

	private long				_ptr_renderer;
	private SDL.Video.Renderer	_renderer;
	private SDL.Video.Surface	_surface;
	private SDL.Video.Texture	_texture;
}

}
