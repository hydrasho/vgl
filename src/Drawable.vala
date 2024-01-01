
namespace BG {

public abstract class Drawable {
	// public abstract unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer);
	public abstract void draw(SDL.Video.Renderer renderer);


	public void move (int x, int y) {
		this.x += x;
		this.y += y;
	}

	public bool visible {get;set;default=true;}

	public Vector2i position;
	public int x {get {return position.x;} set {position.x = value;}}
	public int y {get {return position.y;} set {position.y = value;}}
	public uint width {get {return rect.w;} set {rect.w = value;}}
	public uint height {get {return rect.h;} set {rect.h = value;}}
	
	public SDL.Video.Rect rect; 
}

}
