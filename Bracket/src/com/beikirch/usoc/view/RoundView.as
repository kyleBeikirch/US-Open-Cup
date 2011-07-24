package com.beikirch.usoc.view
{
	import com.beikirch.usoc.model.Round;

	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 21, 2011 - USOC
	//*************************
	
	public class RoundView extends View
	{
		private var numGames:int;
		private var roundData:Round;
		private var gameData:Array;
		private var label:RoundLabel;
		private var padding:int = 70;
		
		public function RoundView($data:Round, $lastRound:int)
		{
			super();
			roundData = $data;
			gameData = $data.games;
			addLabel();
			addGames();
		}
		
		private function addLabel():void
		{
			label = new RoundLabel();
			addChild(label);
			label.roundBox.text = roundData.name;
			label.dateBox.text = roundData.date;
		}
		private function addGames():void
		{
			numGames = gameData.length;
			
			for (var i:int = 0; i < numGames; i++) 
			{
				var game:GameView = new GameView(gameData[i]);
				game.y = (i * (padding * (16/numGames)) + padding + (padding/2 * ((16/numGames)-1)))-10;
				addChild(game);
				game.transitionIn();
			}
		}
	}
}