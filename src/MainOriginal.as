package
{
	import flash.display.Sprite;
	import flash.display.Stage;

	
	public class MainOriginal extends Sprite
	{
		public var locationManager:LocationManager;
		public var mapController:MapController;
		
		public function MainOriginal()
		{
			initialize();
		}
		
		private function initialize():void
		{
			
			locationManager = new LocationManager();
			locationManager.debug = true;
			locationManager.initialize(locationManager_onUpdate);
			
			mapController = new MapController();
			mapController.initialize();
			addChild(mapController);
		}
		
		private function locationManager_onUpdate(newPosition:GeoPosition):void
		{
			switch(locationManager.state)
			{
				case LocationManager.ST_GEO_READY:
				{
					trace( "Current Position newPosition: " + newPosition.stringfy() );
					break;
				}
				case LocationManager.ST_GEO_NOT_SUPPORTED:
				{
					trace( "ERROR, Geo Localization is not supported" );
					break;
				}
				case LocationManager.ST_GEO_MUTTED:
				{
					trace( "ERROR, Geo Localization is mutted" );
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		
	}
}