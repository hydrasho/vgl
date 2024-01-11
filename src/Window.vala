namespace BG {

/**
 * Represents a graphical window with an associated renderer.
 *
 * {{{
 * using BG;
 * 
 * void main() {
 * 	var win = new Window("my supra-title", 100, 150);
 * 	
 * 	while (win.is_open) {
 * 		win.clear(Color.Red);
 * 		win.display();
 * 	}
 * }
 * }}}
 */
public class Window {
	/**
     * Constructor for creating a window with the specified title, width, and height.
     *
     * @param title The title of the window (default is "default title").
     * @param width The width of the window (default is 500).
     * @param height The height of the window (default is 500).
     */
	public Window(string title = "default title", int width = 500, int height = 500) {
		var? window = new SDL.Video.Window(title, 700, 200, width, height, 0);
		assert(window != null);
		_window = (!)(owned)window;

		_renderer = new RendererTexture.from_window(_window, -1, SDL.Video.RendererFlags.ACCELERATED);
		print("renderer: %p\n", _renderer);
		print("sdl_renderer: %p\n", _renderer._renderer);
		_window.get_size(out width, out height);
		this.width = width;
		this.height = height;
		_fps_timer = new Timer();
	}
	/**
	* Sets the bordered property of the window, controlling whether it has a border.
	*
	* @param border A boolean indicating whether the window should have a border.
	*/
	public void set_bordered(bool border) {
		_window.set_bordered(border);
	}

	/**
	* Maximizes the window to occupy the full screen.
	*/
	public void maximize() {
		_window.maximize();
	}

	/**
	* Minimizes the window, reducing it to an icon or a button on the taskbar.
	*/
	public void minimize() {
		_window.minimize();
	}

	/**
	* Resizes the window to the specified width and height.
	*
	* @param width The new width of the window.
	* @param height The new height of the window.
	*/
	public void resize(int width, int height) {
		_window.set_size(width, height);
	}

	/**
	* Sets the position of the window to the specified coordinates.
	*
	* @param x The x-coordinate of the new position.
	* @param y The y-coordinate of the new position.
	*/
	public void set_position(int x, int y) {
		_window.set_position(x, y);
	}

	/**
	* Sets the resizable property of the window, determining whether it can be resized by the user.
	*
	* @param resizable A boolean indicating whether the window can be resized.
	*/
	public void set_resizable(bool resizable) {
		_window.set_resizable(resizable);
	}

	/**
     * Closes the window.
     */
	public void close() {
		is_open = false;
	}

	 /**
     * Draws a sprite on the window.
     *
     * @param sprite The sprite to be drawn.
     */
	public void draw(Drawable drawable, Vector2i? pos = null) {
		if (drawable.visible) {
			drawable.draw(_renderer, pos);
		}
	}

	/**
     * Displays the contents of the window, taking into account the specified frames per second.
     */
	public void display() {
		if (_fps_timer.elapsed() >= 1.0 / (double)fps) {
			_renderer._renderer.present();
			_fps_timer.reset();
		}
		else {
			Thread.usleep(2000);
		}
	}

	/**
     * Clears the window by filling it with a color.
	 * default color is white
     */
	public void clear(Color color = Color.White) {
		_renderer._renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		_renderer._renderer.fill_rect ({0, 0, width, height});
	}

	/**
     * test if the window is open 
     * @return true if the window is open
     */
	public bool is_open {get; private set; default=true;}

	public int fps {get;set;default=60;}
	public string title {get {return _window.title;} set {_window.title = value;}}
	public int width {get; private set;}
	public int height {get; private set;}
	
	/**
	* Gets or sets the visibility state of the window.
	* When getting, returns whether the window is currently visible.
	* When setting, updates the visibility state and shows or hides the window accordingly.
	*
	* @return A boolean indicating whether the window is currently visible.
	*
	* @param value A boolean representing the desired visibility state.
	*              If true, the window will be shown; if false, the window will be hidden.
	*/
	public bool visible {
		get {
			return _visible;
		}
		set {
			_visible = value;
			if (_visible == true)
				_window.show();
			else
				_window.hide();
		}
	}

	private RendererTexture		_renderer;
	private bool				_visible = true;
	private Timer				_fps_timer;
	private SDL.Video.Window	_window;
}
}
