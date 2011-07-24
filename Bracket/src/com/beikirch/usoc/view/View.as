package com.beikirch.usoc.view
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.model.DataParser;
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	
	public class View extends Sprite
	{
		public var parser:DataParser;
		
		public function View()
		{
			hide();
			parser = DataParser.getInstance();
		}
		
		public function show():void
		{
			this.alpha = 1;
			this.visible = true;
		}
		
		public function hide():void
		{
			this.alpha = 0;
			this.visible = false;
		}
		
		public function transitionIn():void
		{
			TweenMax.to(this, .4, {autoAlpha:1});
		}
		
		public function transitionOut():void
		{
			TweenMax.to(this, .4, {autoAlpha:0});
		}
	}
}