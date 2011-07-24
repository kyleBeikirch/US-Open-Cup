package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 20, 2011 - USOC
	//*************************
	
	public class Game
	{
		public var id:int;
		public var homeID:int;
		public var homeScore:int;
		public var awayID:int;
		public var awayScore:int;
		public var extraTime:String;
		public var date:String;
		public var time:String;
		public var location:String;
		public var stadium:String;
		public var report:String;
		public var scoreSheet:XMLList;
		public var events:Array = [];
		
		private var data:Object;
		private var numScores:int;
		
		public function Game($data:Object)
		{
			id = $data.id;
			homeID = $data.homeID;
			homeScore = $data.homeScore;
			awayID = $data.awayID;
			awayScore = $data.awayScore;
			extraTime = $data.extraTime;
			date = $data.date;
			time = $data.time;
			location = $data.location;
			stadium = $data.stadium;
			report = $data.report;
			scoreSheet = $data.scoreSheet.event;
			if(scoreSheet != null)addScoreSheet();
		}
		
		
		private function addScoreSheet():void
		{
			numScores = scoreSheet.length();
		
			for (var i:int = 0; i < numScores; i++) 
			{   
				var eventData:Object = new Object();
				eventData.type = scoreSheet[i].@type;
				eventData.minute = scoreSheet[i].@minute;
				eventData.player = scoreSheet[i].@player;
				eventData.team = scoreSheet[i].@team;
				var event:Event = new Event(eventData);
				events.push(event);
				
			}
		}
	}
}