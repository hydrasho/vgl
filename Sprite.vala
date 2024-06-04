using Vgl;

public class Vgl.Sprite : Vgl.Drawable {
	public Sprite (Texture? texture = null) {
		if (texture != null)
			this.texture = texture;
		else 
			textureRect = {};
	}

	public override void draw (RenderTarget target) {
		target.renderer.copyex(_texture[target].texture, _textureRect, {position.x, position.y, _textureRect.w, _textureRect.h}, rotation, {origin.x, origin.y}, SDL.Video.RendererFlip.NONE);
	}

	/* Property */
	public Rect textureRect {get; set;}
	private Texture _texture;
	public Texture texture {
		get {
			return _texture;
		}
		owned set {
			_texture = value;
			textureRect = {
				0,
				0,
				_texture.width,
				_texture.height
			};
		}
	}
}
