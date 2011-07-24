package com.beikirch.usoc
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 14, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.events.BracketEvent;
	import com.beikirch.usoc.model.DataParser;
	import com.beikirch.usoc.view.ViewManager;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(width="1100", height="1400", frameRate="30")]
	
	public class Bracket extends Sprite
	{
		
		private var teamPath		:String;
		private var bracketPath		:String;
		private var leaguePath		:String;
		private var flashVars		:Object;
		private var parser			:DataParser;
		private var viewManager		:ViewManager;
		
		public function Bracket()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			init();
		}
		
		private function init():void
		{
			loadFlashVars();
			loadConfig();
		}
				
		private function loadFlashVars():void
		{
			flashVars = loaderInfo.parameters;
			bracketPath = flashVars.bracketPath;
			teamPath = flashVars.teamPath;
			leaguePath = flashVars.leaguePath;
			
		}
		
		private function loadConfig():void
		{
			parser = new DataParser();
			parser.setPaths(bracketPath, teamPath, leaguePath);
			parser.addEventListener(BracketEvent.XML_PARSED, showBracket);
		}
		
		private function showBracket(e:BracketEvent):void
		{
			viewManager = new ViewManager();
			addChild(viewManager);
		}
	}
	
}