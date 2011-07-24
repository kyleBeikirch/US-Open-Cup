package com.beikirch.usoc.loaders
{
	import com.beikirch.usoc.Bracket;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	public class ImageLoader extends Sprite
	{
		private var loader:Loader;
		private var bracket:Bracket;
		
		public function ImageLoader($url:String)
		{
			loadImage($url)
		}
		
		private function loadImage($url:String):void
		{
			var request:URLRequest = new URLRequest($url);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.load(request);
		}
		
		private function completeHandler(e:Event):void
		{	
			var loadedBitmap:Bitmap = e.target.content as Bitmap;
			addChild(loadedBitmap);
		}
	}
}