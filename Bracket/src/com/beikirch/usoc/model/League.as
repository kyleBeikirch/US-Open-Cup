package com.beikirch.usoc.model
{
	//*************************
	//   Developed by Kyle Beikirch
	//   Mar 2, 2011 - USOC
	//*************************
	
	public class League
	{
		public var id:int;
		public var name:String;
		public var shortName:String;
		public var color:Number;
		public var logo:String;
		
		public function League($id:int, $name:String, $short:String, $color:Number, $logo:String)
		{
			id = $id;
			name = $name;
			shortName = $short;
			color = $color;
			logo = $logo;
		}
	}
}