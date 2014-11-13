package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Tank extends MovieClip
	{
		private var tankBodyArt:MovieClip; // var voor opslag
		private var tankTurretArt:TankTurretArt;
		public function Tank() 
		{
			tankBodyArt = new TankBodyArt();		//instantieren van de Class
			this.addChild(tankBodyArt);
			
			tankTurretArt = new TankTurretArt();	//instantieren van de Class
			this.addChild(tankTurretArt);
		}
		
	}

}