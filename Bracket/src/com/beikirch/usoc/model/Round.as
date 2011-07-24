package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 18, 2011 - USOC
	//*************************
	
	public class Round
	{
		private var gameData:XMLList;
		private var numGames:int;
		
		public var name:String;
		public var date:String;
		public var games:Array = [];
		
		public function Round($name:String, $date:String, $data:XMLList)
		{
			name = $name;
			date = $date;
			gameData = $data;
			parseData();
			
		}
		
		private function parseData():void
		{
			numGames = gameData.length();
			
			for (var i:int = 0; i < numGames; i++) 
			{
				var gData:Object = new Object();
				gData.id= gameData[i].@id;
				gData.homeID = gameData[i].homeID;
				gData.homeScore = gameData[i].homeScore;
				gData.awayID = gameData[i].awayID;
				gData.awayScore = gameData[i].awayScore;
				gData.extraTime = gameData[i].extraTime;
				gData.date = gameData[i].date;
				gData.time = gameData[i].time;
				gData.location = gameData[i].location;
				gData.stadium = gameData[i].stadium;
				gData.report = gameData[i].report;
				gData.scoreSheet = gameData[i].scoreSheet;
				var game:Game = new Game(gData);
				games.push(game);
				
			}
		}
	}
}