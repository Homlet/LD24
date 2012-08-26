package uk.co.homletmoo.LD24 
{
	import net.flashpunk.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class GameWorld extends World
	{
		protected var level:Level;
		
		override public function begin():void
		{
			FP.screen.color = Const.COL_WALL;
			
			Input.define(Const.CTRL_UP, Key.UP, Key.W);
			Input.define(Const.CTRL_RIGHT, Key.RIGHT, Key.D);
			Input.define(Const.CTRL_DOWN, Key.DOWN, Key.S);
			Input.define(Const.CTRL_LEFT, Key.LEFT, Key.A);
			
			level = new Level();
			
			add(level);
		}
		
	}

}