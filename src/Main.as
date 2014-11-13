package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Main extends Sprite 
	{
		private var tank:Tank;
		private var dPressed:Boolean = false;
		private var aPressed:Boolean = false;
		private var wPressed:Boolean = false;
		private var sPressed:Boolean = false;
		private var angleSpeed:Point = new Point(0,0);
		private var moveDirection:int = 0;
	

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tank = new Tank(); 
			this.addChild(tank);
			tank.x = stage.stageWidth * 0.5
			tank.y = stage.stageHeight * 0.5
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function loop(e:Event):void 
		{

			if (dPressed == true) //Draai movement
			{
				tank.rotation += 5;
			}
			
			if (aPressed == true)	//Draai movement
			{
				tank.rotation -= 5;
			}
			
			if (wPressed == true) //Omhoog
			{
				moveDirection = 1;
			}	
			else if (sPressed)
			
			{ 
				moveDirection = -1;
			} 
			
			else if (wPressed == false)
			{
				moveDirection = 0;
			}
			
			else if (sPressed == false)
			{
				moveDirection = 0;
			}

			angleSpeed.x = Math.sin(tank.rotation * (Math.PI / 180)) * 2;
			angleSpeed.y = Math.cos(tank.rotation * (Math.PI / 180)) * 2 * -1;
			
			tank.x += angleSpeed.x * moveDirection;
			tank.y += angleSpeed.y * moveDirection;
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
		
			if (e.keyCode == Keyboard.D) // D is ingedrukt
			{
				dPressed = true;
			}
			
						if (e.keyCode == Keyboard.A) // A is ingedrukt
			{
				aPressed = true;
			}
			
						if (e.keyCode == Keyboard.W) // W is ingedrukt
			{
				wPressed = true;
			}
			
						if (e.keyCode == Keyboard.S) // S is ingedrukt
			{
				sPressed = true;
			}
		}

		private function onKeyUp(e:KeyboardEvent):void
		{
						if (e.keyCode == Keyboard.D) // D is losgelaten
			{
				dPressed = false;
			}
			
									if (e.keyCode == Keyboard.A) // A is losgelaten
			{
				aPressed = false;
			}
			
									if (e.keyCode == Keyboard.W) // W is losgelaten
			{
				wPressed = false;
			}
			
									if (e.keyCode == Keyboard.S) // S is losgelaten
			{
				sPressed = false;
			}
			
			
		}
		
	}

}