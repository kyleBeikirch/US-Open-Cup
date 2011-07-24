package com.beikirch.usoc.view
{
	
	//*************************
	//   Developed by Kyle Beikirch
	//   Mar 2, 2011 - USOC
	//*************************
	
	public class LeaguesView extends View
	{
		
		private var leagueData:Array;
		private var numLeagues:int;
		private var leagueSpacing:int = 200;
		public function LeaguesView()
		{
			super();
			init();
		}
		
		private function init():void
		{
			leagueData = parser.leagues;
			numLeagues = leagueData.length;
			for (var i:int = 0; i < numLeagues; i++) 
			{
				var table:LeagueTable = new LeagueTable(leagueData[i].id, leagueData[i].name);
				table.x = i * leagueSpacing;
				addChild(table);
				table.transitionIn();
				
			}
		}
		
		
	}
}