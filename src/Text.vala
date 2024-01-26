namespace Vgl {

/**
 * Represents a text element.
 *
 *
 * {{{
 * Text text = new Text ("My text", 12);
 *
 * win.draw (text);
 * }}}
 */
public class Text : Shape {
	/**
     * Constructor for creating a Text element with specified label, size, and font.
     *
     * @param label The text content of the Text element (default is an empty string).
     * @param size The font size of the Text element (default is 24).
     * @param font The font family of the Text element (default is "Arial").
     */
	public Text(string label = "", int size = 24, string font = "Arial"){
		base(1, 1);
		position = {0, 0};
		_label = label;
		_font = font;
		_size = size;
		_color = color;
	}

	protected override void draw_func(Cairo.Context ctx, int width, int height) {
		base.draw_func(ctx, width, height);
		Cairo.TextExtents extents;
		// ctx.set_source_rgb(1, 1, 1);
		// ctx.rectangle(0, 0, width/2, height);
		// ctx.fill();
		ctx.select_font_face (_font, Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
		ctx.set_font_size (_size);
		ctx.text_extents (_label, out extents);
		var sp = _label.split("\n");
		int max_length = 0;
		int id_max = 0;
		for (int i = 0; i < sp.length; i++)
		{
			var len = sp[i].length;
			if (len > max_length){
				max_length = len;
				id_max = i;
			}
		}
		ctx.text_extents (sp[id_max], out extents);
		max_length = (int)Math.ceil(extents.width) + 10; //TODO
		ctx.text_extents (_label, out extents);
		int w, h;
		w = max_length;
		h = (int)Math.ceil(extents.height) * sp.length + 5;
		if (width != w || height != h) {
			base.redraw(w, h);
			return ;
		}
		ctx.set_source_rgb (color.red/255.0, color.green/255.0, color.blue/255.0); // couleur noire
		for (int i = 0; i < sp.length; i++)
		{
			ctx.move_to (extents.x_bearing, extents.height * (i + 1));
			ctx.show_text (sp[i]);
		}
		ctx.stroke();
	}

	public override void draw(RenderTarget renderer, Vector2i? pos = null)
	{
		base.draw(renderer, pos);
	}

	public string	label {get {return _label;} set{_label = value; redraw();}}
	public string	font {get {return _font;} set{_font = value; redraw();}}
	public int		size {get {return _size;} set{_size = value; redraw();}}
	public Color	color{get {return _color;} set{_color= value; redraw();}}

	private string	_label;
	private Color	_color;
	private int		_size;
	private string	_font;
}

}
