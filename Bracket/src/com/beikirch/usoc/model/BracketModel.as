package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 15, 2011 - USOC
	//*************************
	
	public class BracketModel
	{
		
		private var bracketData:XML;
		private var numRounds:int;
		private var numGames:int;
		private var theGame:Game;
		
		public var rounds:Array = [];
		public var title:String;
		public function BracketModel($data:XML)
		{
			bracketData = $data;
			parseData(bracketData);
		}
		
		private function parseData(xml:XML):void
		{
			title = bracketData.year;
			
			numRounds = xml.round.length();
			
			for (var i:int = 0; i < numRounds; i++) 
			{
				var name:String = bracketData.round[i].@name;
				var date:String = bracketData.round[i].@date;
				var games:XMLList = bracketData.round[i].game;
				var round:Round = new Round(name, date, games);
				rounds.push(round);
			}
		}
		
		public function getGameData(aint:int):Game
		{
			for (var i:int = 0; i < numRounds; i++) 
			{
				numGames = rounds[i].games.length;
				
				for (var j:int = 0; j < numGames; j++) 
				{
					if(aint == rounds[i].games[j].id)
					{
						theGame = rounds[i].games[j];
					}
					
				}
			}
			
			return theGame
		}
		
	}
}