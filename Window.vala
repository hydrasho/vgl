using Vgl;

public class Vgl.Window : Object, IWindow {

	public Window (string title, Vector2i pos, Vector2i size, WindowFlags flags) {
		(this as IWindow)?.create_window(title, pos, size, flags);
	} 

	public bool is_open {set; get; default = true;}
	public SDL.Video.Window window {get; protected owned set;}
}

