
namespace BG {

public abstract class Drawable {
	// public abstract unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer);
	public abstract void draw(SDL.Video.Renderer renderer);


	public void move (int x, int y) {
		this.x += x;
		this.y += y;
	}

	public bool visible {get;set;default=true;}

	public Vector2i position {
		get {
			return {rect.x, rect.y};
		}
		set{
			rect.x = value.x;
			rect.y = value.y;
		}
	}
	public int x {get {return rect.x;} set {rect.x = value;}}
	public int y {get {return rect.y;} set {rect.y = value;}}
	public uint width {get {return rect.w;} set {rect.w = value;}}
	public uint height {get {return rect.h;} set {rect.h = value;}}
	
	public SDL.Video.Rect rect; 
}

}
