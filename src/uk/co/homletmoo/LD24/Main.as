package uk.co.homletmoo.LD24
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width = "512", height = "512", backgroundColor = "#1A1414")]
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class Main extends Engine
	{
		public static var q:Quake;
		
		public function Main():void
		{
			super(Const.DIS_SIZE, Const.DIS_SIZE, 60, false);
		}
		
		override public function init():void
		{
			q = new Quake();
			
			FP.world = new GameWorld();
		}
		
		override public function update():void
		{
			q.update();
			
			super.update();
		}
		
	}
	
}