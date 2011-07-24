package com.beikirch.usoc.view
{
	import com.beikirch.usoc.events.BracketEvent;
	import com.beikirch.usoc.loaders.BracketLogoLoader;
	import com.beikirch.usoc.model.Game;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	public class GameView extends View
	{
		private var data:Game;
		private var homeLogo:BracketLogoLoader;
		private var awayLogo:BracketLogoLoader;
		private var score:GameScore;
		
		public function GameView($data:Game)
		{
			super();
			data = $data;
			init();
			
		}
		
		private function init():void
		{
			loadScore();
			//addLeagueColors();
			loadLogos();
			
			
		}
		
		private function loadScore():void
		{
			score = new GameScore();
			addChild(score);
			score.x = 25;
			if(data.awayID == -1) score.homeName.text = "";
			else
			{
				score.homeName.text = parser.teams[data.awayID].name;
				addCover();
			}
				
			
			if(data.homeID == -1) score.awayName.text = "";
			else score.awayName.text = parser.teams[data.homeID].name;
			autoSize(score.awayName);
			autoSize(score.homeName);
			
			score.homeScore.text = String(data.awayScore);
			if(data.awayScore == -1) score.homeScore.text = "";
			score.awayScore.text = String(data.homeScore);
			if(data.homeScore == -1) score.awayScore.text = "";
			
			score.extraBox.text = data.extraTime;
			
		}
		
		private function autoSize(txt:TextField):void 
		{
			//You set this according to your TextField's dimensions
			var maxTextWidth:int = 123; 
			
			var f:TextFormat = txt.getTextFormat();
			
			//decrease font size until the text fits  
			while (txt.textWidth > maxTextWidth) {
				f.size = int(f.size) - 1;
				txt.setTextFormat(f);
			}
			
			txt.y += 12 - int(f.size);
			
		}
		
		private function addLeagueColors():void
		{
			if(data.awayID != -1)
			{
				var awayID:int = (parser.teams[data.awayID].league);
				
				if(awayID != -1)
				{
					var awayColor:Sprite = new Sprite();
					awayColor.graphics.beginFill(parser.leagues[awayID].color, .1);
					awayColor.graphics.drawRect(0, 0, this.width, score.awayMask.height+2);
					awayColor.graphics.endFill();
					addChild(awayColor);
					awayColor.x = score.awayMask.x-1+ score.x;
				}
			}
			
			if(data.homeID != -1)
			{
				var homeID:int = (parser.teams[data.homeID].league);
				
				if(homeID != -1)
				{
					var homeColor:Sprite = new Sprite();
					homeColor.graphics.beginFill(parser.leagues[homeID].color, .1);
					homeColor.graphics.drawRect(0, 0, this.width, score.homeMask.height+2);
					homeColor.graphics.endFill();
					addChild(homeColor);
					homeColor.x = score.homeMask.x-1+ score.x;
					homeColor.y = score.homeMask.y;
				}
			}
		}
		
		
		private function loadLogos():void
		{
			if(data.homeID != -1)
			{
				
				if(parser.teams[data.homeID].logo != "")
				{
					awayLogo = new BracketLogoLoader(parser.teams[data.homeID].logo);
					addChild(awayLogo);
					awayLogo.y = -1;
					awayLogo.mask = score.awayMask;
				}
			}
			
			if(data.awayID != -1)
			{
				if(parser.teams[data.awayID].logo != "")
				{
					homeLogo = new BracketLogoLoader(parser.teams[data.awayID].logo);
					addChild(homeLogo);
					homeLogo.y = 15;
					homeLogo.mask = score.homeMask;
				}
			}
		}
		
		
		
		private function addCover():void
		{
			this.buttonMode = true;
			var cover:Sprite = new Sprite();
			cover.graphics.beginFill(0x000000, 0);
			cover.graphics.drawRect(6, 0, this.width, this.height);
			cover.graphics.endFill();
			addChild(cover);
			this.addEventListener(MouseEvent.MOUSE_UP, gameClick);
		}
		
		private function gameClick(e:MouseEvent):void
		{
			var gData:Object = new Object();
			gData.gameID = data.id;
			gData.vertical = this.y;
			dispatchEvent(new BracketEvent(BracketEvent.OPEN_GAME_INFO, gData, true));
		}
		
	}
}