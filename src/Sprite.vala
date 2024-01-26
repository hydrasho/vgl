namespace Vgl {
/**
 * Represents a frame in an animation with a specified position and dimensions.
 */
public class Frame {
	public Frame(Rect rect) {
		this.rect = rect;
	}
	public Rect rect;
}

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
		base(texture.w, texture.h);
		frames = new Gee.ArrayList<Frame>();
		this.texture = texture;
	}

	public override void draw(RenderTarget renderer, Vector2i? pos = null) {
		uint round(uint a, double b) {
			return (uint)Math.round(a * b);
		}
		Vector2i p = pos ?? position;
		SDL.Video.Texture tex = texture.get_texture(renderer);
		if (frames.size > 0){
			var r = frames[index_frames].rect;
			renderer.copy(tex, r, {p.x, p.y, round(r.w, scale.x), round(r.h, scale.y)}, angle, origin, flip);
		}
		else
			renderer.copy(tex, rect, {p.x, p.y, round(rect.w, scale.x), round(rect.h, scale.y)}, angle, origin, flip);

	}

	public void setTextureRect(Rect rect) {
		this.rect = rect;
	}

	/**
	* Adds a frame to the animation at the specified index.
	*
	* @param frame The frame to be added.
	* @param index The index at which to insert the frame (By default: appends at the end).
	*/
	public void add_frame(Frame frame, int index = -1) {
		if (index == -1)
			frames.add(frame);
		else
			frames.insert(index, frame);
	}

	/**
	* Get the length of frames animation.
	*/
	public int len_frame () {
		return frames.size;
	}

	/**
	* Sets the current frame index for the animation.
	*
	* @param index The index of the frame to set as the current frame.
	*/
	public void set_frame(uint index) {
		index_frames = (int)index;
	}

	/**
	* Decreases to the previous frame in the animation.
	*/
	public void prev_frame() {
		index_frames--;
		if (index_frames == -1)
			index_frames = frames.size - 1;
	}

	/**
	* Increases to the next frame in the animation.
	*/
	public void next_frame() {
		index_frames++;
		if (index_frames == frames.size)
			index_frames = 0;
	}

	/**
	* Removes the frame at the specified index from the animation.
	*
	* @param index The index of the frame to be removed.
	*/
	public void remove_frame(int index) {
		frames.remove_at(index);
	}

	
	/**
	* The texture rectangle, defining the portion to be displayed in a sprite.
	* For example, to display only a part of the texture using a 16x16 rectangle.
	*/
	public Rect texture_rect {
		get {
			return rect;
		}
		set {
			rect = value;
		}
	}

	private int index_frames {get; set;default = 0;}
	public Gee.ArrayList<Frame> frames;
	public Texture texture;
}
}
