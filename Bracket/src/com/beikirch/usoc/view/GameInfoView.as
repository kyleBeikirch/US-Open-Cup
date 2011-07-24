package com.beikirch.usoc.view
{
	import com.beikirch.usoc.events.BracketEvent;
	import com.beikirch.usoc.loaders.InfoViewLogoLoader;
	import com.beikirch.usoc.model.Game;
	import com.beikirch.usoc.view.buttons.CloseButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 28, 2011 - USOC
	//*************************
	
	public class GameInfoView extends View
	{
		
		private var data:Game;
		private var panel:GameInfoPanel;
		private var close:CloseButton;
		private var homeLogo:InfoViewLogoLoader;
		private var awayLogo:InfoViewLogoLoader;
		private var iconHolder:Sprite;
		
		public function GameInfoView()
		{
			super();
			addPanel();
		}
		
		private function addPanel():void
		{
			
			panel = new GameInfoPanel();
			addChild(panel);
			close = new CloseButton();
			addChild(close);
			close.y = 5;
			close.x = 775 - close.width - 5;
			close.addEventListener(MouseEvent.MOUSE_UP, closePanel);
			iconHolder = new Sprite();
			addChild(iconHolder);
		}
		
		private function closePanel(e:MouseEvent):void
		{
			dispatchEvent(new BracketEvent(BracketEvent.CLOSE_GAME_INFO));
		}
		
		public function update(aInt:int):void
		{
			data = parser.bracketModel.getGameData(aInt);
			loadLogos();
			addScoreSheet();
			changeText();
			transitionIn();
		}
		
		private function loadLogos():void
		{
			if(awayLogo) removeChild(awayLogo);
			if(homeLogo) removeChild(homeLogo);
			if(data.homeID != -1)
			{
				
				if(parser.teams[data.awayID].logo != "")
				{
					awayLogo = new InfoViewLogoLoader(parser.teams[data.awayID].logo);
					addChild(awayLogo);
					awayLogo.x =  20;
					awayLogo.y =  20;
				}
			}
			
			if(data.homeID != -1)
			{
				if(parser.teams[data.homeID].logo != "")
				{
					homeLogo = new InfoViewLogoLoader(parser.teams[data.homeID].logo);
					addChild(homeLogo);
					homeLogo.x = 555;
					homeLogo.y = 20;
				}
			}
		}
		
		
		private function addScoreSheet():void
		{
			removeChild(iconHolder);
			iconHolder = null;
			iconHolder = new Sprite();
			addChild(iconHolder);
			if(data.events.length >0)
			{	
				var homeCount:int;
				var awayCount:int;
				var startHeight:int = 250;
				for (var i:int = 0; i < data.events.length; i++) 
				{	
					var icon:ScoreIcon = new ScoreIcon();
					if(data.events[i].team == data.awayID) 
					{
						icon.x = 20;
						icon.y = startHeight + awayCount * 22;
						awayCount++;
					}
					
					if(data.events[i].team == data.homeID) 
					{
						icon.x = 555;
						icon.y = startHeight + homeCount * 22;
						homeCount++;
					}
					
					icon.nameBox.text = data.events[i].minute + "' - " + data.events[i].player;
					iconHolder.addChild(icon)
					icon.gotoAndStop(data.events[i].type);
				}
				
			}
		}
		
		private function changeText():void
		{
			panel.awayName.text = parser.teams[data.awayID].name;
			panel.homeName.text = parser.teams[data.homeID].name;
			panel.awayScore.text = String(data.awayScore);
			if(panel.awayScore.text == "-1") panel.awayScore.text = "";
			panel.homeScore.text = String(data.homeScore);
			if(panel.homeScore.text == "-1") panel.homeScore.text = "";
			panel.timeBox.text = data.date + " - " + data.time;
			panel.stadiumBox.text = data.stadium;
			panel.locationBox.text = data.location;
			panel.etBox.text = data.extraTime;
		}
	}
}