package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 20, 2011 - USOC
	//*************************
	
	public class Event
	{
		public var type:String;
		public var minute:int;
		public var player:String;
		public var team:int;
		
		private var data:Object;
		private var numScores:int;
		
		public function Event($data:Object)
		{
			type = $data.type;
			minute = $data.minute;
			player = $data.player;
			team = $data.team;
		}
	}
}