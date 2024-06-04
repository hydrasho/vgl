using Vgl;

public enum Vgl.WindowFlags {
	ALLOW_HIGHDPI = SDL.Video.WindowFlags.ALLOW_HIGHDPI,
	BORDERLESS = SDL.Video.WindowFlags.BORDERLESS,
	FOREIGN = SDL.Video.WindowFlags.FOREIGN,
	FULLSCREEN = SDL.Video.WindowFlags.FULLSCREEN,
	FULLSCREEN_DESKTOP = SDL.Video.WindowFlags.FULLSCREEN_DESKTOP,
	HIDDEN = SDL.Video.WindowFlags.HIDDEN,
	INPUT_FOCUS = SDL.Video.WindowFlags.INPUT_FOCUS,
	INPUT_GRABBED = SDL.Video.WindowFlags.INPUT_GRABBED,
	MAXIMIZED = SDL.Video.WindowFlags.MAXIMIZED,
	MINIMIZED = SDL.Video.WindowFlags.MINIMIZED,
	MOUSE_CAPTURE = SDL.Video.WindowFlags.MOUSE_CAPTURE,
	MOUSE_FOCUS = SDL.Video.WindowFlags.MOUSE_FOCUS,
	OPENGL = SDL.Video.WindowFlags.OPENGL,
	RESIZABLE = SDL.Video.WindowFlags.RESIZABLE,
	SHOWN = SDL.Video.WindowFlags.SHOWN
}

public interface Vgl.IWindow {

	protected void create_window (string title, Vector2i pos, Vector2i size, WindowFlags flags) {
		window = new SDL.Video.Window(title, pos.x, pos.y, size.x, size.y, flags);
	}

	/**
	* Sets the bordered property of the window, controlling whether it has a border.
	*
	* @param border A boolean indicating whether the window should have a border.
	*/
	public void set_bordered(bool border) {
		window.set_bordered(border);
	}

	/**
	* Maximizes the window to occupy the full screen.
	*/
	public void maximize() {
		window.maximize();
	}

	/**
	* Minimizes the window, reducing it to an icon or a button on the taskbar.
	*/
	public void minimize() {
		window.minimize();
	}

	/**
	* Resizes the window to the specified width and height.
	*
	* @param width The new width of the window.
	* @param height The new height of the window.
	*/
	public void resize(int width, int height) {
		window.set_size(width, height);
	}

	/**
	* Sets the position of the window to the specified coordinates.
	*
	* @param x The x-coordinate of the new position.
	* @param y The y-coordinate of the new position.
	*/
	public void set_position(int x, int y) {
		window.set_position(x, y);
	}

	/**
	* Gets the position of the window.
	*
	* @return Vector2i x and y coordinate
	*/
	public Vector2i get_position() {
		int x;
		int y;
		window.get_position(out x, out y);
		return {x, y};
	}

	public void show () {
		window.show();
	}
	
	public void hide () {
		window.hide();
	}


	/**
	* Sets the resizable property of the window, determining whether it can be resized by the user.
	*
	* @param resizable A boolean indicating whether the window can be resized.
	*/
	public void set_resizable(bool resizable) {
		window.set_resizable(resizable);
	}

	/**
     * Closes the window.
     */
	public void close() {
		is_open = false;
	}

	public bool grab {
		get {
			return window.grab;
		}
		set {
			window.grab= grab;
		}
	}

	public string title {
		get {
			return window.title;
		}
		set {
			window.title= title;
		}
	}
	
	public int y {
		get {
			int x; int y;
			window.get_position(out x, out y);
			return y;
		}
		set {
			window.set_position(x, value);
		}
	}

	public int x {
		get {
			int x; int y;
			window.get_position(out x, out y);
			return x;
		}
		set {
			window.set_position(value, y);
		}
	}

	public abstract bool is_open {set; get; default = true;}
	public abstract SDL.Video.Window window {get; protected owned set;}
}
