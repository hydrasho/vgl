namespace BG {

public class Sprite : Drawable {
	public Sprite (Texture texture) {
		this.texture = texture;
		rect = {0, 0, texture.width, texture.height};
		visible = true;
	}

	// public override unowned SDL.Video.Texture get_sdl_texture (SDL.Video.Renderer renderer) {
		// return texture.get_sdl_texture(renderer);
	// }
	public override void draw(SDL.Video.Renderer renderer) {
		unowned SDL.Video.Texture tex = texture.get_sdl_texture(renderer);
		renderer.copy(tex,
			this.rect,
			{this.x, this.y, this.rect.w, this.rect.h});
	}

	public Texture texture;
}
}
