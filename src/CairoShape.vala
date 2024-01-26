
namespace Vgl {

/**
* Represents a shape intended for drawing using Cairo graphics, inheriting from the base Shape class.
*
* Here an example for draw a simple black line with CairoLib
* {{{
* var cairo = new CairoShape (500, 500);
* cairo.draw_func.connect ((ctx, w, h) => {
* 	ctx.set_source_rgb (0, 0, 0); // black color 
* 	ctx.move_to (0, 0);
* 	ctx.line_to(w, h);
* 	ctx.stroke();
* });
* //...
* win.draw(cairo);
* //...
* }}}
*/
public class CairoShape : Shape {
	/**
	* Create a simple CairoShape
	*
	* @param width The initial width of the CairoShape.
	* @param height The initial height of the CairoShape.
	*/

	public override void draw_func(Cairo.Context ctx, int width, int height) {
	
	}

	public CairoShape (int width, int height) {
		base(width, height);
	}
}
}
