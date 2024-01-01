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
		window = new SDL.Video.Window(title, 700, 200, width, height, 0);
		renderer = SDL.Video.Renderer.create(window, -1, SDL.Video.RendererFlags.ACCELERATED);
		window.get_size(out width, out height);
		this.width = width;
		this.height = height;
		fps_timer = new Timer();
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
	public void draw(Drawable drawable) {
		if (drawable.visible) {
			drawable.draw(renderer);
		}
	}

	/**
     * Displays the contents of the window, taking into account the specified frames per second.
     */
	public void display() {
		if (fps_timer.elapsed() >= 1.0 / (double)fps) {
			renderer.present();
			fps_timer.reset();
		}
		else {
			Thread.usleep(1000);
		}
	}

	/**
     * Clears the window by filling it with a color.
	 * default color is white
     */
	public void clear(Color color = Color.White) {
		renderer.set_draw_color(color.red, color.green, color.blue, color.alpha);
		renderer.fill_rect ({0, 0, width, height});
	}

	/**
     * test if the window is open 
     * @return true if the window is open
     */
	public bool is_open {get; private set; default=true;}

	public int fps {get;set;default=60;}
	public string title {get {return window.title;} set {window.title = value;}}
	public int width {get; private set;}
	public int height {get; private set;}
	public SDL.Video.Renderer renderer;
	

	private Timer fps_timer;
	private SDL.Video.Window window;
}
}
