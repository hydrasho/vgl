namespace BG {


public class Text : Shape {
	public Text(string label){
		base(500, 500);
		position = {0, 0};
		this.label = label;
	}

	public override void draw_func(Cairo.Context ctx, int width, int height) {
		Cairo.TextExtents extents;
		ctx.select_font_face ("DejaVu", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
		ctx.set_font_size (44);
		ctx.set_source_rgb (0, 0, 0); // couleur noire
		ctx.text_extents (label, out extents);

		// double x = (width- extents.width) / 2; // centre horizontalement
		// double y = (height- extents.height) / 2; // centre verticalement
		// base.redraw((int)extents.width, (int)extents.height);
		ctx.move_to (x, y);
		ctx.show_text (label);
		ctx.stroke();
	}
	string label;
}

}
