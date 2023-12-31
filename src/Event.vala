namespace BG {

public class Event {
	private Event () { }

	/**
	* get the instance of the Event
	*/
	public static Event @default() {
		if (instance == null)
			instance = new Event();
		return instance;
	}
	private static BG.Event? instance = null;

	/**
	* Poll for currently pending events
	*/
	public void poll() {
		if (SDL.Event.poll(out event) == 0)
			return;

		switch ((int)event.type) {
			case SDL.EventType.QUIT:
				onClose();
				break;
			case SDL.EventType.KEYUP:
				onKeyUp(event.key.keysym.sym.get_name());
				break;
			case SDL.EventType.KEYDOWN:
				onKeyDown(event.key.keysym.sym.get_name());
				break;
			case SDL.EventType.MOUSEBUTTONUP:
				onMouseUp(event.button.x, event.button.y, event.button.button);
				break;
			case SDL.EventType.MOUSEBUTTONDOWN:
				onKeyDown(event.key.keysym.sym.get_name());
				break;
			case SDL.EventType.MOUSEMOTION:
				onMouseMove(event.motion.x, event.motion.y, event.motion.xrel, event.motion.yrel);
				break;
		}
	}

	/**
	* Signal triggered when a window is closed, either through Alt+F4 or by clicking the close button.
	*/
	public signal void onClose();
	/**
	* Signal triggered when a key on the keyboard is released.
	*/
	public signal void onKeyUp(string code);
	/**
	* Signal triggered when a key on the keyboard is pressed down.
	*/
	public signal void onKeyDown(string code);
	/**
	* Signal triggered when a mouse button is released 
	* @param x window coordinates
	* @param y window coordinates
	* @param type_button TypeButton like Left|Right
	*/
	public signal void onMouseUp(int x, int y, BG.MouseType type_button);
	/**
	* Signal triggered when a mouse button is pressed 
	* @param x window coordinates
	* @param y window coordinates
	* @param type_button TypeButton like Left|Right
	*/
	public signal void onMouseDown(int x, int y, BG.MouseType type_button);
	/**
	* Signal triggered when there is mouse movement 
	* @param x window coordinates
	* @param y window coordinates
	* @param xrel relative displacement
	* @param yrel relative displacement
	*/
	public signal void onMouseMove(int x, int y, int xrel, int yrel);


	public bool is_up		{get;set;default=false;} 
	public bool is_down 	{get;set;default=false;} 
	public bool is_left		{get;set;default=false;} 
	public bool is_right	{get;set;default=false;} 

	private SDL.Event event;
}

public enum MouseType {
	LEFT = 1,
	MIDDLE = 2,
	RIGHT = 3,
	BUTTON4 = 4,
	BUTTON5 = 5,
	BUTTON6 = 6,
	BUTTON7 = 7,
	BUTTON8 = 8,
	BUTTON9 = 9,
}

}

