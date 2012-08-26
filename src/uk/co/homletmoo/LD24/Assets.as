package uk.co.homletmoo.LD24 
{
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class Assets 
	{
		// -------- IMAGE SOURCE --------------------------------------------------------------------|
		
		// Flashpunk logo (animated)
		[Embed (source = 'res/flashpunk.png')]
		public static const FP_RAW:Class;
		
		// HomletMedia logo
		[Embed (source = 'res/hm.png')]
		public static const HM_RAW:Class;
		
		// Button spritesheet
		[Embed (source = 'res/buttons.png')]
		public static const BUTTONS_RAW:Class;
		
		// Title art
		[Embed (source = 'res/art.png')]
		public static const ART_RAW:Class;
		
		// -------- LEVEL SOURCE --------------------------------------------------------------------|
		
		[Embed (source = 'level/1.png')] public static const LEVEL_1:Class;
		[Embed (source = 'level/2.png')] public static const LEVEL_2:Class;
		[Embed (source = 'level/3.png')] public static const LEVEL_3:Class;
		[Embed (source = 'level/4.png')] public static const LEVEL_4:Class;
		[Embed (source = 'level/5.png')] public static const LEVEL_5:Class;
		[Embed (source = 'level/6.png')] public static const LEVEL_6:Class;
	}

}