package uk.co.homletmoo.LD24
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width = "512", height = "512", backgroundColor = "#FFFFFF")]
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class Main extends Engine
	{
		public function Main():void
		{
			super(Const.DIS_WIDTH, Const.DIS_HEIGHT, 60, false);
		}
		
		override public function init():void
		{
			FP.world = new SplashWorld();
		}
		
	}
	
}