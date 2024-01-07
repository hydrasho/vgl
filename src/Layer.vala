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
		surface = new SDL.Video.Surface.rgb(width, height, 32, 0xff, 0xff00, 0xff0000, (uint32)0xff000000);
		renderer = SDL.Video.Renderer.create_from_surface(surface);
		renderer.set_draw_blend_mode (SDL.Video.BlendMode.BLEND);
		ptr_renderer = 0;
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
		drawable.draw(this.renderer, pos);
		ptr_renderer = 0;
	}

	public override void draw(SDL.Video.Renderer renderer_window, Vector2i? pos = null) {
		if (pos == null)
			pos = {x, y};
		if (ptr_renderer != (long)&renderer) {
			texture = SDL.Video.Texture.create_from_surface(renderer_window, surface);
			ptr_renderer = (long)&renderer;
		}
		renderer_window.copyex(texture, rect, {pos.x, pos.y, rect.w, rect.h}, angle, {origin.x, origin.y}, (SDL.Video.RendererFlip)flip);
	}

	private long ptr_renderer;
	private SDL.Video.Renderer renderer;
	private SDL.Video.Surface surface;
	private SDL.Video.Texture texture;
}

}
