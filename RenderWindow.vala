using Vgl;

public class Vgl.RenderWindow : RenderTarget {
	public enum WindowFlags {
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

	public RenderWindow (string title, Vector2i pos, Vector2i size, WindowFlags flags) {
		window = new SDL.Video.Window(title, pos.x, pos.y, size.x, size.y, 0);
		base.create_from_window(window, 1, 1);
	} 

	public bool is_open {set; get; default = true;}
	SDL.Video.Window window;
}
