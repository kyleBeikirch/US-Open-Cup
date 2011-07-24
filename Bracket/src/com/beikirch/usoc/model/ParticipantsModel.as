package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 15, 2011 - USOC
	//*************************
	
	public class ParticipantsModel
	{
		private var teamData:XML;
		private var numTeams:int;
		public var imagePath:String;
		private var teamArray:Array = [];
		
		public function ParticipantsModel($data:XML)
		{
			teamData = $data;
			parseData(teamData);
		}
		
		private function parseData(xml:XML):void
		{
			imagePath = xml.imagePath;
			
			numTeams = xml.team.length();
			
			for (var i:int = 0; i < numTeams; i++) 
			{
				var id:int = teamData.team[i].id;
				var name:String = teamData.team[i].name;
				var short:String = teamData.team[i].shortName;
				var league:String = teamData.team[i].league;
				var color1:Number = teamData.team[i].mainColor;
				var color2:Number = teamData.team[i].secondColor;
				var logo:String = imagePath + "images/logos/big/" + teamData.team[i].logo;
				trace(logo);
				var team:Team = new Team(id, name, short, league, color1, color2, logo);
				teamArray.push(team);
			}
			
		}

		public function get teams():Array
		{
			return teamArray;
		}

	}
}