using Vgl;

public class Vgl.RenderTexture : RenderTarget {
	public RenderTexture(int width, int height){
		texture = new Texture.from_size (width, height);
		base.create_from_surface (texture.surface);
	}

	public Texture texture {get; private set;}
}
