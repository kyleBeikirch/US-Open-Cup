package com.beikirch.usoc.loaders
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Mar 13, 2011 - USOC
	//*************************
	
	public class InfoViewLogoLoader extends ImageLoader
	{
		public function InfoViewLogoLoader($url:String)
		{
			var logoURL:String = $url;
			super(logoURL);
		}
	}
}