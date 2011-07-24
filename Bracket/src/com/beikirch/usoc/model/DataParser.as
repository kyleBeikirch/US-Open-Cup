package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 14, 2011 - USOC
	//*************************
	
	import com.beikirch.usoc.events.BracketEvent;
	import com.beikirch.usoc.loaders.XMLLoader;
	
	import flash.events.EventDispatcher;
	
	public class DataParser extends EventDispatcher
	{
		private static var instance		:DataParser;
		
		private var teamPath			:String;
		private var bracketPath			:String;
		private var leaguePath			:String;
		private var teamLoader			:XMLLoader;
		private var bracketLoader		:XMLLoader;
		private var leagueLoader		:XMLLoader;
		private var teamData			:XML;
		private var bracketData			:XML;
		private var leagueData			:XML;
		
		public var teamModel			:ParticipantsModel;
		public var bracketModel			:BracketModel;
		public var leagueModel			:LeaguesModel;
		
		public function DataParser()
		{
			instance = this;
		}
		
		public static function getInstance():DataParser
		{
			return instance;
		}
		
		public function setPaths($bracket:String, $teams:String, $leagues:String):void
		{
			bracketPath = $bracket;
			teamPath = $teams;
			leaguePath = $leagues;
			loadBracket(bracketPath);
		}
		
		
		
		
		public function loadBracket($url:String):void
		{
			bracketLoader = new XMLLoader($url);
			bracketLoader.addEventListener(BracketEvent.XML_LOADED, parseBracket);
		}
		
		public function loadTeams($url:String):void
		{
			teamLoader = new XMLLoader($url);
			teamLoader.addEventListener(BracketEvent.XML_LOADED, parseTeams);
		}
		
		public function loadLeagues($url:String):void
		{
			leagueLoader = new XMLLoader($url);
			leagueLoader.addEventListener(BracketEvent.XML_LOADED, parseLeagues);
		}
		
		
		
		
		public function parseBracket(e:BracketEvent):void
		{
			bracketData = e.data.xml;
			bracketModel = new BracketModel(bracketData);
			loadTeams(teamPath);			
		}
		
		public function parseTeams(e:BracketEvent):void
		{
			teamData = e.data.xml;
			teamModel = new ParticipantsModel(teamData);
			loadLeagues(leaguePath);
		}
		
		public function parseLeagues(e:BracketEvent):void
		{
			leagueData = e.data.xml;
			leagueModel = new LeaguesModel(leagueData);
			dispatchEvent(new BracketEvent(BracketEvent.XML_PARSED));			
		}
		
		
		
		
		
		
		public function get teams():Array
		{
			return teamModel.teams;
		}
		
		public function get rounds():Array
		{
			return bracketModel.rounds;
		}
		
		public function get leagues():Array
		{
			return leagueModel.leagues;
		}
	}
}