package com.beikirch.usoc.view
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 16, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.events.BracketEvent;
	import com.beikirch.usoc.model.DataParser;
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	
	public class ViewManager extends Sprite
	{
		private var bg		:Background;
		private var parser	:DataParser;
		private var bracket	:BracketView;
		private var leagues	:LeaguesView;
		private var gameInfo:GameInfoView;
		
		
		public function ViewManager()
		{
			init();
			this.x = 20;
			
		}
		
		private function init():void
		{
			parser = DataParser.getInstance();
			addBackground();
			addBracket();
			addLeagueChart();
			addPopUps();
		}
		
		private function addBackground():void
		{
			bg = new Background();
			addChild(bg);
		}
		
		private function addBracket():void
		{
			bracket = new BracketView();
			addChild(bracket);
			bracket.transitionIn();
			bracket.addEventListener(BracketEvent.OPEN_GAME_INFO, openGameView);
		}
		
		private function addLeagueChart():void
		{
			leagues = new LeaguesView();
			addChild(leagues);
			leagues.x = 7;
			leagues.y = bracket.height;
			leagues.transitionIn();
		}
		
		private function addPopUps():void
		{
			gameInfo = new GameInfoView();
			addChild(gameInfo);
			gameInfo.x = 150;
			gameInfo.y = 200;
			gameInfo.addEventListener(BracketEvent.CLOSE_GAME_INFO, closeGameView);
		}
		
		private function openGameView(e:BracketEvent):void
		{
			gameInfo.update(e.data.gameID);	
			var heightScale:Number = (e.data.vertical-70) / 1050; 
			gameInfo.y = 130 + 600 * heightScale;
			TweenMax.to(bracket, .3, {blurFilter:{blurX:6, blurY:6}});
			TweenMax.to(bg, .3, {blurFilter:{blurX:6, blurY:6}});
		}
		
		private function closeGameView(e:BracketEvent):void
		{
			gameInfo.transitionOut();
			TweenMax.to(bracket, .3, {blurFilter:{blurX:0, blurY:0}});
			TweenMax.to(bg, .3, {blurFilter:{blurX:0, blurY:0}});
		}
	}
}