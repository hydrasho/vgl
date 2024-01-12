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
		resize(width, height);
	}

	public Layer.no_size() {
		base(0, 0);
	}

	public new void resize(int width, int height) {
		base.resize(width, height);
		surface = new RenderTexture.size(width, height);
		
		var? renderer = SDL.Video.Renderer.create_from_surface(surface.surface);
		assert(renderer != null);
		_renderer = (!)(owned)renderer;
		_renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
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
	}

	/**
     * Clears the layer by filling it with a color.
	 * default color is full transparancy
     */
	public void clear(Color? color = null) {
		if (color == null)
			surface.clear();
		else {
			var c = (!)color;
			_renderer.set_draw_color(c.red, c.green, c.blue, c.alpha);
			_renderer.fill_rect ({0, 0, width, height});
		}
	}

	public override void draw(SDL.Video.Renderer renderer, Vector2i? pos = null) {
		Vector2i p = pos ?? position;
		var texture = surface.get_texture(renderer);
		renderer.copyex(texture, rect, {p.x, p.y, rect.w, rect.h}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
	}

	private RenderTexture		surface;
	private SDL.Video.Renderer	_renderer;
}

}
