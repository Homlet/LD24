package uk.co.homletmoo.LD24 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Homletmoo
	 */
	public class Level extends Entity 
	{
		private var _levels:Vector.<BitmapData> = new Vector.<BitmapData>();
		private var _referenceLevels:Vector.<BitmapData> = new Vector.<BitmapData>();
		private var _image:Image;
		private var _currLevel:int = 1;
		private var _currIndex:int = _currLevel - 1;
		private var _currSize:int = Math.pow(2, _currLevel);
		private var _ppos:Point;
		private var _tpos:Point;
		private var _changed:Boolean = true;
		
		private var _moving:Point = new Point(0, 0);
		private var _moveRemainder:Number = 0;
		
		public function Level():void
		{
			_levels.push(FP.getBitmap(Assets.LEVEL_1));
			_levels.push(FP.getBitmap(Assets.LEVEL_2));
			_levels.push(FP.getBitmap(Assets.LEVEL_3));
			_levels.push(FP.getBitmap(Assets.LEVEL_4));
			_levels.push(FP.getBitmap(Assets.LEVEL_5));
			_levels.push(FP.getBitmap(Assets.LEVEL_6));
			
			for (var i:int = 0; i < _levels.length; i++)
				_referenceLevels.push(_levels[i].clone());
			
			Main.q.start(4, 0.4);
			
			findEntities();
			rebuildLevel();
		}
		
		override public function update():void
		{
			if (Input.pressed(Const.CTRL_UP)
			 && _moving.equals(new Point(0, 0)))
				_moving = new Point(0, -1);
			
			if (Input.pressed(Const.CTRL_RIGHT)
			 && _moving.equals(new Point(0, 0)))
				_moving = new Point(1, 0);
			
			if (Input.pressed(Const.CTRL_DOWN)
			 && _moving.equals(new Point(0, 0)))
				_moving = new Point(0, 1);
			
			if (Input.pressed(Const.CTRL_LEFT)
			 && _moving.equals(new Point(0, 0)))
				_moving = new Point( -1, 0);
			
			if (!_moving.equals(new Point(0, 0)))
				movePlayer();
			
			if (_ppos.equals(_tpos))
				next();
			
			if (_changed)
				rebuildLevel();
			
			super.update();
		}
		
		private function findEntities():void
		{
			for (var i:int = 0; i < _currSize; i++)
				for (var j:int = 0; j < _currSize; j++)
				{
					if (_referenceLevels[_currIndex].getPixel(i, j) == Const.COL_PLAYER)
					{
						_ppos = new Point(i, j);
						_referenceLevels[_currIndex].setPixel(i, j, Const.COL_WHITE);
					}
						
					if (_referenceLevels[_currIndex].getPixel(i, j) == Const.COL_TARGET)
					{
						_tpos = new Point(i, j);
						_referenceLevels[_currIndex].setPixel(i, j, Const.COL_WHITE);
					}
				}
			
			if (_ppos == null)
				_ppos = new Point(0, 0);
			
			if (_tpos == null)
				_ppos = new Point(0, 0);
		}
		
		private function next():void
		{
			if (_currLevel < Const.LVL_FINAL)
			{
				_currLevel++;
				_currIndex++;
				_currSize = Math.pow(2, _currLevel);
				
				Main.q.start(4, 0.4);
				
				_moving = new Point(0, 0);
				_moveRemainder = 0;
				
				findEntities();
				_changed = true;
			}
		}
		
		private function movePlayer():void
		{
			var temp:Point = _ppos.clone();
			
			if (_moving.x != 0)
			{
				var distance:int = int((_moving.x * FP.elapsed * Const.PLR_SPEED) + _moveRemainder);
				_moveRemainder = (_moving.x * FP.elapsed * Const.PLR_SPEED) % 1;
				for (var i:int = 0; Math.abs(i) < Math.abs(distance); i += FP.sign(distance))
					if (_referenceLevels[_currIndex].getPixel(_ppos.x + FP.sign(distance), _ppos.y) != Const.COL_WALL
					&&  _ppos.x + FP.sign(distance) >= 0
					&&  _ppos.x + FP.sign(distance) < _currSize)
					{
						_ppos.x += FP.sign(distance);
						_levels[_currIndex].setPixel(_ppos.x, _ppos.y, Const.COL_PLAYER);
					} else
					{
						_levels[_currIndex].setPixel(_ppos.x, _ppos.y, Const.COL_PLAYER);
						
						_moving = new Point(0, 0);
						_moveRemainder = 0;
						break;
					}
			} else
			{
				distance = int((_moving.y * FP.elapsed * Const.PLR_SPEED) + _moveRemainder);
				_moveRemainder = (_moving.y * FP.elapsed * Const.PLR_SPEED) % 1;
				for (i = 0; Math.abs(i) < Math.abs(distance); i += FP.sign(distance))
					if (_referenceLevels[_currIndex].getPixel(_ppos.x, _ppos.y + FP.sign(distance)) != Const.COL_WALL
					&&  _ppos.y + FP.sign(distance) >= 0
					&&  _ppos.y + FP.sign(distance) < _currSize)
					{
						_ppos.y += FP.sign(distance);
						_levels[_currIndex].setPixel(_ppos.x, _ppos.y, Const.COL_PLAYER);
					} else
					{
						_levels[_currIndex].setPixel(_ppos.x, _ppos.y, Const.COL_PLAYER);
						
						_moving = new Point(0, 0);
						_moveRemainder = 0;
						break;
					}
			}
			
			if(!_ppos.equals(temp))
				_changed = true;
		}
		
		private function rebuildLevel():void
		{
			for (var i:int = 0; i < _currSize; i++)
				for (var j:int = 0; j < _currSize; j++)
				{
					var pixel:int = _referenceLevels[_currIndex].getPixel(i, j);
					if (pixel == Const.COL_WHITE
					 && !_ppos.equals(new Point(i, j))
					 && !_tpos.equals(new Point(i, j)))
					{
						var plrDist:Number = FP.distance(i, j, _ppos.x, _ppos.y) / (Const.COL_PLR_FADE_RANGE * _currLevel);
						var targetDist:Number = FP.distance(i, j, _tpos.x, _tpos.y) / (Const.COL_TARGET_FADE_RANGE * _currLevel);
						
						_levels[_currIndex].setPixel(i, j, FP.colorLerp(Const.COL_BG, Const.COL_FADE, Math.min(plrDist, targetDist)));
					} else if (pixel == Const.COL_WALL
							&& !_ppos.equals(new Point(i, j))
							&& !_tpos.equals(new Point(i, j)))
					{
						plrDist = FP.distance(i, j, _ppos.x, _ppos.y) / (Const.COL_PLR_FADE_RANGE * _currLevel);
						targetDist = FP.distance(i, j, _tpos.x, _tpos.y) / (Const.COL_TARGET_FADE_RANGE * _currLevel);
						
						_levels[_currIndex].setPixel(i, j, FP.colorLerp(Const.COL_WALL, Const.COL_FADE, Math.min(plrDist, targetDist)));
					}
				}
			
			_image = new Image(_levels[_currIndex]);
			_image.scale = int(Const.DIS_SIZE / Math.pow(2, _currLevel));
			graphic = _image;
			
			_changed = false;
		}
	}

}