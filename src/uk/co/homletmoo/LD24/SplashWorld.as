package uk.co.homletmoo.LD24
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class SplashWorld extends World 
	{
		public static const FADE_SCREENS:Number = 2;
		
		protected var logos:Entity;
		protected var fpStrip:Spritemap;
		protected var hmImage:Image;
		
		protected var fader:NumTween = new NumTween(finish);
		protected var fadeRect:Image = Image.createRect(FP.width, FP.height, 0);
		protected var fadeEnt:Entity;
		protected var fadeIterator:Number = 0;
		
		override public function begin():void
		{
			logos = new Entity(0, 0);
			fpStrip = new Spritemap(Assets.FP_RAW, 100, 100);
			fpStrip.scale = 3;
			fpStrip.y = FP.height - fpStrip.scaledHeight;
			fpStrip.add("run", [0, 1, 2, 3, 4], 8, true);
			fpStrip.play("run");
			
			hmImage = new Image(Assets.HM_RAW);
			hmImage.scale = 1.2;
			hmImage.x = FP.width;
			
			logos.graphic = new Graphiclist(fpStrip, hmImage);
			
			fadeEnt = new Entity(0, 0, fadeRect);
			fadeIn();
			
			add(logos);
			add(fadeEnt);
			addTween(fader);
		}
		
		override public function update():void
		{
			fadeRect.alpha = fader.value;
			
			super.update();
		}
		
		private function fadeIn():void
		{
			fader.tween(1, 0, 2, Ease.cubeOut);
			
			if (fadeIterator == 1)
			{
				fpStrip.x = FP.width;
				
				hmImage.x = (FP.width / 2) - (hmImage.scaledWidth / 2);
				hmImage.y = (FP.height / 2) - (hmImage.scaledHeight / 2);
			}
		}
		
		private function fadeOut():void
		{
			fader.tween(0, 1, 3, Ease.cubeIn);
		}
		
		public function finish():void
		{
			if (fader.value == 0)
				fadeOut()
			else if (fadeIterator++ < FADE_SCREENS - 1)
				fadeIn()
			else
				FP.world = new GameWorld();
		}
		
	}

}