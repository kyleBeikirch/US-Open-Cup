package com.beikirch.usoc.view.buttons
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 28, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.view.CloseXButton;
	import com.greensock.TweenLite;
	
	import flash.events.MouseEvent;
	
	public class CloseButton extends CloseXButton
	{
		public function CloseButton()
		{
			super();
			this.buttonMode = true;
			this.alpha = .7;
			this.addEventListener(MouseEvent.MOUSE_OVER, buttonOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, buttonOut);
		}
		
		
		private function buttonOver(e:MouseEvent):void
		{
			TweenLite.to(this, .4, {alpha:1});
		}
		
		private function buttonOut(e:MouseEvent):void
		{
			TweenLite.to(this, .4, {alpha:.7});
		}
	}
}