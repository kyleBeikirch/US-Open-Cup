package com.beikirch.usoc.loaders
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 17, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.events.BracketEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher
	{
		private var loader:URLLoader;
		private var xmlUrl:String;
		private var xmlObj:XML;
		
		public function XMLLoader($xmlUrl:String)
		{
			xmlUrl = $xmlUrl;
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, getXML);
			loader.load(new URLRequest(xmlUrl));
		}
		
		private function getXML(e:Event):void
		{
			loader.removeEventListener(Event.COMPLETE, getXML);
			xmlObj = new XML(e.target.data);
			var data:Object = new Object();
			data.xml = xmlObj;
			dispatchEvent(new BracketEvent(BracketEvent.XML_LOADED, data));
		}
	}
}