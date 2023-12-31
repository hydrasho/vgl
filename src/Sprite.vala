namespace BG {

public class Sprite {
	public Sprite (Texture texture) {
		this.texture = texture;
		texture_rect.x = 0;
		texture_rect.y = 0;
		texture_rect.w = texture.width;
		texture_rect.h = texture.height;
		visible = true;
	}

	public unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer) {
		return texture.get_sdl_texture(renderer);
	}
	
	public void move (int x, int y) {
		this.x += x;
		this.y += y;
	}

	public bool visible;
	public SDL.Video.Rect texture_rect; 
	public int width {get {return texture.width;}}
	public int height {get {return texture.height;}}
	public Vector2i position; 
	public int x {get {return this.position.x;} set {this.position.x = value;}}
	public int y {get {return this.position.y;} set {this.position.y = value;}}
	public Texture texture;
}
}
