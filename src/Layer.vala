namespace Vgl {

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
		target = new RenderTarget.from_texture(surface);
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
		drawable.draw(target, pos);
	}

	/**
     * Clears the layer by filling it with a color.
	 * default color is full transparancy
     */
	public void clear(Color? color = null) {
		if (color == null)
			surface.clear();
		else
			target.clear((!)color);
	}

	public override void draw(RenderTarget renderer, Vector2i? pos = null) {
		Vector2i p = pos ?? position;
		var texture = surface.get_texture(renderer);
		renderer.copy(texture, rect, {p.x, p.y, rect.w, rect.h}, angle, origin, flip);
	}

	private RenderTexture	surface;
	private RenderTarget	target;
}

}
