using Vgl;

public class Vgl.Sprite : Transformable, Drawable {
	public Sprite (Texture texture) {
		this.texture = texture;
		textureRect = {
			0,
			0,
			texture.width,
			texture.height
		};
	}
	public Rect textureRect {get; set;}

	void draw (RenderTarget target) {
		target.renderer.copyex(texture[target], textureRect, {position.x, position.y, _textureRect.w, textureRect.h}, rotation, {origin.x, origin.y}, SDL.Video.RendererFlip.NONE);
	}
	Texture texture;
}
