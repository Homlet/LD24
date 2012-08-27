package uk.co.homletmoo.LD24 
{
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class Const 
	{
		// -------- DISPLAY CONSTANTS ---------------------------------------------------------------|
		
		// Display width and height in pixels
		public static const DIS_SIZE:int = 512;
		
		// -------- COLOUR CONSTANTS ----------------------------------------------------------------|
		
		// Player colour
		public static const COL_PLAYER:int = 0x230000;
		
		// Wall colour
		public static const COL_WALL:int = 0x6F0000;
		
		// Target colour
		public static const COL_TARGET:int = 0xBB0000;
		
		// Background base colour
		public static const COL_BG:int = 0xFFCFCF;
		
		// Faded colour
		public static const COL_FADE:int = 0x1A1414;
		
		// White
		public static const COL_WHITE:int = 0xFFFFFF;
		
		// Range of background fade
		public static var COL_PLR_FADE_RANGE:Number = 2.5;
		
		// Range of background fade
		public static const COL_TARGET_FADE_RANGE:Number = 0.75;
		
		// -------- CONTROL CONSTANTS ---------------------------------------------------------------|
		
		// Move up
		public static const CTRL_UP:String = 'u';
		
		// Move right
		public static const CTRL_RIGHT:String = 'r';
		
		// Move down
		public static const CTRL_DOWN:String = 'd';
		
		// Move left
		public static const CTRL_LEFT:String = 'l';
		
		// -------- LEVEL CONSTANTS -----------------------------------------------------------------|
		
		// Total number of levels
		public static const LVL_FINAL:int = 6;
		
		// -------- PLAYER CONSTANTS ----------------------------------------------------------------|
		
		// Player speed
		public static const PLR_SPEED:Number = 25;
	}

}