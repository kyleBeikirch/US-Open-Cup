package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Mar 2, 2011 - USOC
	//*************************
	
	public class LeaguesModel
	{
		private var leagueData:XML;
		private var numLeagues:int;
		private var leagueArray:Array = [];
		
		public function LeaguesModel($data:XML)
		{
			leagueData = $data;
			parseData(leagueData);
		}
		
		private function parseData(xml:XML):void
		{
			numLeagues = xml.league.length();
			
			for (var i:int = 0; i < numLeagues; i++) 
			{
				var id:int = leagueData.league[i].id;
				var name:String = leagueData.league[i].name;
				var short:String = leagueData.league[i].shortName;
				var color:Number = leagueData.league[i].color;
				var logo:String = leagueData.league[i].logo;
				var league:League = new League(id, name, short, color, logo);
				leagueArray.push(league);
			}
			
		}
		
		public function get leagues():Array
		{
			return leagueArray;
		}
	}
}