namespace BG {

/**
 * Represents a layer that can be drawn on and contains drawable objects or pixels/lines.
 *
 * How draw an Object in the layer ?
 * Example:
 * {{{
 *    var circle = new CircleShape(50, Color.Red);
 *    var layer = new Layer(100, 100);
 *    
 *    circle.draw(layer.renderer);
 *    layer.draw_line(0, 12, 100, 100);
 *
 *    while (win.is_open) {
 *    	win.clear();
 *    	win.draw(layer);
 *    	win.present();
 *    }
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
		texture = null;
		ptr_renderer = 0;
	}
	
	public override void draw(SDL.Video.Renderer renderer_window, Vector2i? pos = null) {
		if (pos == null)
			pos = {x, y};
		if (ptr_renderer != (long)&renderer) {
			texture = SDL.Video.Texture.create_from_surface(renderer_window, surface);
			ptr_renderer = (long)&renderer;
		}
		renderer_window.copy(texture, rect, {pos.x, pos.y, rect.w, rect.h});
	}

	/**
	* Saves the Layer as a BMP image file with the specified filename.
	*
	* @param file The filename for the BMP image file to be saved.
	*/
	public void save(string file) {
		// FIXIT 
		SDL.RWops* e;
		e = new SDL.RWops.from_file (file, "wb");
		surface.save_bmp_rw (e, 1);
	}

	/**
	* Draws a line on the renderer from (x1, y1) to (x2, y2) with the specified color.
	*
	* @param x1 The x-coordinate of the starting point.
	* @param y1 The y-coordinate of the starting point.
	* @param x2 The x-coordinate of the ending point.
	* @param y2 The y-coordinate of the ending point.
	* @param color The color of the line (default is Color.White).
	*/
	public void draw_line(int x1, int y1, int x2, int y2, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.draw_line(x1, y1, x2, y2);
	}
	/**
	* Draws connected lines between the specified array of points with the specified color.
	*
	* @param points An array of Vector2i points defining the lines.
	* @param color The color of the lines (default is Color.White).
	*/	
	public void draw_lines(Vector2i[] points, Color color = Color.White) {
		if (points.length <= 1)
			return;
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		Vector2i ptr = points[0];
		foreach (var i in points[1:]) {
			renderer.draw_line(ptr.x, ptr.y, i.x, i.y);
			ptr = i;
		}
	}

	/**
	* Draws a point at the specified coordinates with the specified color.
	*
	* @param x The x-coordinate of the point.
	* @param y The y-coordinate of the point.
	* @param color The color of the point (default is Color.White).
	*/
	public void draw_point(int x, int y, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.draw_point(x, y);
	}

	/**
	* Draws a series of points using the specified array of points and color.
	*
	* @param points An array of points to be drawn.
	* @param color The color of the points (default is Color.White).
	*/
	public void draw_points(Vector2i[] points, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		foreach (var i in points) {
			renderer.draw_point(i.x, i.y);
		}
	}

	/**
	* Draws the outline of a rectangle with the specified color.
	*
	* @param rect The rectangle to be drawn (null for no rectangle).
	* @param color The color of the rectangle (default is Color.White).
	*/
	public void draw_rect(Rect? rect, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.draw_rect(rect);
	}

	/**
	* Draws the outline of multiple rectangles with the specified color.
	*
	* @param rects An array of rectangles to be drawn.
	* @param color The color of the rectangles (default is Color.White).
	*/
	public void draw_rects(Rect[] rects, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.draw_rects(rects);
	}

	/**
	* Fills the interior of a rectangle with the specified color.
	*
	* @param rect The rectangle to be filled (null for no rectangle).
	* @param color The color to fill the rectangle with (default is Color.White).
	*/
	public void fill_rect(Rect? rect, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.fill_rect(rect);
	}

	/**
	* Fills the interior of multiple rectangles with the specified color.
	*
	* @param rects An array of rectangles to be filled.
	* @param color The color to fill the rectangles with (default is Color.White).
	*/
	public void fill_rects(Rect[] rects, Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.fill_rects(rects);
	}
	
	private long ptr_renderer;
	public SDL.Video.Renderer renderer;
	private SDL.Video.Surface surface;
	private SDL.Video.Texture texture;
}

}
