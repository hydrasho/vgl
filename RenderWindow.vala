using Vgl;

public class Vgl.RenderWindow : RenderTarget, IWindow {

	public RenderWindow (string title, Vector2i pos, Vector2i size, WindowFlags flags) {
		this.create_window(title, pos, size, flags);
		(this as IWindow)?.create_window(title, pos, size, flags);
		base.create_from_window(window, 1, 1);
	} 

	public bool is_open {set; get; default = true;}
	public SDL.Video.Window window {get; protected owned set;}
}
