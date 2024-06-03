using Vgl;

public class Vgl.Text : Shape {
	public Text(string label = "", int size = 24, string font = "Arial"){
		position = {0, 0};
		_label = label;
		_font = font;
		_size = size;
		_color = color;
		alloc_size(1, 1);
		cairo_draw_func();
	}

	protected override void cairo_draw_func() {
		base.cairo_draw_func();
		Cairo.TextExtents extents;
		ctx.select_font_face (_font, Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
		ctx.set_font_size (_size);
		ctx.text_extents (_label, out extents);
		var sp = _label.split("\n");
		int max_length = 0;
		int id_max = 0;
		for (int i = 0; i < sp.length; ++i)
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
		alloc_size(w, h);
		ctx.set_source_rgb (_color.red/255.0, _color.green/255.0, _color.blue/255.0);
		ctx.set_font_size (_size);
		for (int i = 0; i < sp.length; ++i)
		{
			ctx.move_to (extents.x_bearing, extents.height * (i + 1));
			ctx.show_text (sp[i]);
		}
		ctx.stroke();
	}

	private string	_label;
	private Color	_color;
	private int		_size;
	private string	_font;


	public string	label {get {return _label;} set{_label = value; cairo_draw_func();}}
	public string	font {get {return _font;} set{_font = value; cairo_draw_func();}}
	public int		size {get {return _size;} set{_size = value;  cairo_draw_func();}}
	public Color	color{get {return _color;} set{_color= value; cairo_draw_func();}}

}
