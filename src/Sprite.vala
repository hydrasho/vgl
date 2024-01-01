namespace BG {

/**
 * Represents a sprite, inheriting from the Drawable class.
 */
public class Sprite : Drawable {
	/**
     * Constructor for creating a Sprite with the specified texture.
     *
     * @param texture The texture to be associated with the sprite.
     */
	public Sprite (Texture texture) {
		this.texture = texture;
		rect = {0, 0, texture.width, texture.height};
		width = texture.width;
		height = texture.height;
		visible = true;
	}

	public override void draw(SDL.Video.Renderer renderer) {
		unowned SDL.Video.Texture tex = texture.get_sdl_texture(renderer);
		renderer.copy(tex, rect, {x, y, rect.w, rect.h});

	}

	public void setTextureRect(SDL.Video.Rect rect) {
		this.rect = rect;
	}

	
	
	public Texture texture;
	
	/**
	* The texture rectangle, defining the portion to be displayed in a sprite.
	* For example, to display only a part of the texture using a 16x16 rectangle.
	*/
	public SDL.Video.Rect texture_rect {
		get {
			return rect;
		}
		set {
			rect = value;
		}
	}
	private SDL.Video.Rect rect; 
}
}
