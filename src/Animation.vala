namespace Vgl {
/**
	* Represents a simple animation timer for managing timed animations.
	*/
public class Animate {
	/**
		* Constructor for creating an Animate object with the specified time interval.
		*
		* @param ms The time interval, in milliseconds, for the animation.
		*/
	public Animate (double ms) {
		timer = new Timer();
		this.ms = ms;
	}
	/**
		* Checks if the specified time interval has elapsed since the last animation trigger.
		* If true, resets the timer and indicates that an animation should occur.
		*
		* @return A boolean indicating whether an animation should occur.
		*/
	public bool animation () {
		if (timer.elapsed () >= ms) {
			timer.reset();
			return true;
		}
		return false;
	}
	/**
		* Resets the timer to start counting from the beginning.
		*/
	public void reset () {
		timer.reset ();
	}

	private double ms {get;set;}
	private Timer timer;
}

}
