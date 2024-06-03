namespace Vgl {

	[SimpleType]
	public struct Vector2i {
		int x;
		int y;
	}
	
	[SimpleType]
	public struct Vector2u {
		uint x;
		uint y;
	}

	[SimpleType]
	public struct Vector2f {
		double x;
		double y;
	}

	public struct Rect : SDL.Video.Rect {
	}

	public struct Color {
		Color (uint8 red = 0, uint8 green = 0, uint8 blue = 0, uint8 alpha = 255) {
			this.red = red;
			this.green = green;
			this.blue = blue;
			this.alpha = alpha;
		}
		uint8 red;
		uint8 green;
		uint8 blue;
		uint8 alpha;

		public const Color Red = {255, 0, 0, 255};
		public const Color White = {255, 255, 255, 255};
	}
}
