namespace BG {

errordomain ColumnsError {
	TEXTURE_INVALID
}

/**
 * Represents a color in RGBA format.
 *
 * @param red   The red component of the color (0-255).
 * @param green The green component of the color (0-255).
 * @param blue  The blue component of the color (0-255).
 * @param alpha The alpha (transparency) component of the color (0-255).
 */

public struct Color {
	public const Color White = {255,255,255, 255};
	public const Color Black = {0,0,0, 255};
	public const Color Red = {255, 0, 0, 255};
    public const Color Green = {0, 255, 0, 255};
    public const Color Blue = {0, 0, 255, 255};
    public const Color Yellow = {255, 255, 0, 255};
    public const Color Cyan = {0, 255, 255, 255};
    public const Color Magenta = {255, 0, 255, 255};
	public const Color Gray = {128, 128, 128, 255};
    public const Color Orange = {255, 165, 0, 255};
    public const Color Purple = {128, 0, 128, 255};
    public const Color Brown = {139, 69, 19, 255};

	/**
	* @param red   The red component of the color (0-255).
	* @param green The green component of the color (0-255).
	* @param blue  The blue component of the color (0-255).
	* @param alpha The alpha (transparency) component of the color (0-255).
	*/
	Color(uint8 red, uint8 green, uint8 blue, uint8 alpha = 255) {
		this.red = red;
		this.green = green;
		this.blue = blue;
		this.alpha = alpha;
	}
	uint8 red;
	uint8 green;
	uint8 blue;
	uint8 alpha;
}

/**
 * Represents a 2D integer vector.
 *
 * @param x The X-coordinate of the vector.
 * @param y The Y-coordinate of the vector.
 */
public struct Vector2i {
	int x;
	int y;
}

/**
 * Represents a 3D integer vector.
 *
 * @param x The X-coordinate of the vector.
 * @param y The Y-coordinate of the vector.
 * @param z The Z-coordinate of the vector.
 */
public struct Vector3i {
	int x;
	int y;
	int z;
}

}
