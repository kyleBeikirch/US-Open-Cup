package com.beikirch.usoc.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	//*************************
	//   Developed by Kyle Beikirch
	//   Mar 10, 2011 - USOC
	//*************************
	
	public class LeagueTable extends View
	{
		private var header:LeagueLabel;
		private var id:String;
		private var theName:String;
		private var teams:Array;
		
		public function LeagueTable($id:String, $name:String)
		{
			super();
			id = $id;
			theName = $name;
			init();
		}
		
		private function init():void
		{
			addHeader();
			addTeams();
			
		}
		
		
		private function addHeader():void
		{
			header = new LeagueLabel();
			header.leagueName.text = theName;
			autoSize(header.leagueName);
			addChild(header);
			var leagueColor:Sprite = new Sprite();
			leagueColor.graphics.beginFill(parser.leagues[id].color, .2);
			leagueColor.graphics.drawRect(0, 0, header.width, header.height);
			leagueColor.graphics.endFill();
			addChild(leagueColor);
			leagueColor.x = header.x;
			leagueColor.y = header.y;
			
		}
		
		private function addTeams():void
		{
			teams = parser.teams;
			var numTeams:int = teams.length;
			var teamCount:int;
			for (var i:int = 0; i < numTeams; i++) 
			{
				if(teams[i].league == id)
				{
					var teamLabel:TeamLabel = new TeamLabel();
					teamLabel.teamName.text = teams[i].name;
					teamLabel.y = teamCount * 14+ 17;
					addChild(teamLabel);
					teamCount++;
				}
			}
		}
		
		private function autoSize(txt:TextField):void 
		{
			//You set this according to your TextField's dimensions
			var maxTextWidth:int = 162; 
			
			var f:TextFormat = txt.getTextFormat();
			
			//decrease font size until the text fits  
			while (txt.textWidth > maxTextWidth) {
				f.size = int(f.size) - 1;
				txt.setTextFormat(f);
			}
			
			txt.y += 12 - int(f.size);
			
		}
	}
}