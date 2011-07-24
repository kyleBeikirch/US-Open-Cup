package com.beikirch.usoc.loaders
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	public class BracketLogoLoader extends ImageLoader
	{
		public function BracketLogoLoader($url:String)
		{
			var logoURL:String = $url;
			super(logoURL);
			
			this.scaleX = this.scaleY = .1;
			this.x= 7;
		}
	}
}