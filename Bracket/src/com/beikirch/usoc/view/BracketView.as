package com.beikirch.usoc.view
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	public class BracketView extends View
	{
		private var numRounds:int;
		private var roundData:Array;
		private var roundSpacing:int = 180;
		private var lastRoundNum:int = 0;
		private var header:Header;
		
		public function BracketView()
		{
			super();
			init();
		}
		
		private function init():void
		{
			header = new Header();
			header.y = 8;
			header.x = 512;
			header.titleBox.text = parser.bracketModel.title;
			addChild(header);
			
			
			roundData = parser.rounds
			numRounds = roundData.length;
			for (var i:int = 0; i < numRounds; i++) 
			{
				var round:RoundView = new RoundView(roundData[i], lastRoundNum);
				round.x = i * roundSpacing;
				round.y = 50;
				addChild(round);
				round.transitionIn();
				lastRoundNum = roundData[i].games.length;
			}
		}
	}
}