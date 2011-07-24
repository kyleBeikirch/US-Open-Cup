package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Feb 17, 2011 - USOC
	//*************************
	
	public class Team
	{
		public var id:int;
		public var name:String;
		public var shortName:String;
		public var league:String;
		public var color1:Number;
		public var color2:Number;
		public var logo:String;
		
		public function Team($id:int, $name:String, $short:String, $league:String, $color1:Number, $color2:Number, $logo:String)
		{
			id = $id;
			name = $name;
			shortName = $short;
			league = $league;
			color1 = $color1;
			color2 = $color2;
			logo = $logo;
		}

	}
}