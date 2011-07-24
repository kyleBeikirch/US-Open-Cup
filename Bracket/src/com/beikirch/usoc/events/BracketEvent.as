package com.beikirch.usoc.events
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 16, 2011 - USOC
	//*************************
	
	import flash.events.Event;
	
	
	public class BracketEvent extends Event
	{
		public static const XML_LOADED:String = "xmlLoaded";
		public static const XML_PARSED:String = "xmlParsed";
		public static const OPEN_GAME_INFO:String = "openGameInfo";
		public static const CLOSE_GAME_INFO:String = "closeGameInfo";
		
		public var data:Object;
		
		public function BracketEvent($type:String, $data:Object = null, $bubbles:Boolean = false, $cancelable:Boolean = false)
		{
			super($type, $bubbles, $cancelable);
			this.data = $data;
		}
	}
}