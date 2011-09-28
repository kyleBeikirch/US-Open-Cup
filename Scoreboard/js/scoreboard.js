var teamData;
$(document).ready(function() {
	$.ajax({
        type: "GET",
        url: "http://thecup.us/brackets/2011/us_open/data/2011teams.xml",
        dataType: "xml",
        success: teamParser
    });
});


function teamParser(xml){
		
	var jsonData = XMLObjectifier.xmlToJSON(xml);
	teamData = jsonData.team;
	$.ajax({
	       type: "GET",
	       url: "http://thecup.us/brackets/2011/us_open/data/2011bracket.xml",
	       dataType: "xml",
	       success: bracketParser
	   });
};


function bracketParser(xml) {
	
    $(xml).find("game").each(function() {
		var homeID = $(this).find("homeID").text();
		var homeData = teamData[homeID];
		var homeName = homeData.name[0].Text;
		var homeScore = $(this).find("homeScore").text();
		if(homeScore === "-1") homeScore = "";
		var awayID = $(this).find("awayID").text();
		var awayData = teamData[awayID];
		var awayName = awayData.name[0].Text;
		var awayScore = $(this).find("awayScore").text()
		if(awayScore === "-1") awayScore = "";
		if(homeID !== -1  && awayID !== -1) $(".items").prepend('<div class="scoreCard"><div class="title">' + $(this).find("date").text() + '</div><div class="home"><div class="teamName">' + homeName + '</div><div class="gameScore">' + homeScore + '</div></div><div class="away"><div class="teamName">' + awayName + '</div><div class="gameScore">' + awayScore + '</div></div>');

    });

	$(".scrollable").scrollable({});
	var api = $(".scrollable").data("scrollable");
	var scrollLength = api.getSize();
	api.onBeforeSeek(function()
	{
		if(api.getIndex() > scrollLength - 10) return false;
	});
	
	

};


// Changes XML to JSON
function xmlToJson(xml) {
  
  // Create the return object
  var obj = {};

  if (xml.nodeType == 1) { // element
    // do attributes
    if (xml.attributes.length > 0) {
    obj["@attributes"] = {};
      for (var j = 0; j < xml.attributes.length; j++) {
        var attribute = xml.attributes.item(j);
        obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
      }
    }
  } else if (xml.nodeType == 3) { // text
    obj = xml.nodeValue;
  }

  // do children
  if (xml.hasChildNodes()) {
    for(var i = 0; i < xml.childNodes.length; i++) {
      var item = xml.childNodes.item(i);
      var nodeName = item.nodeName;
      if (typeof(obj[nodeName]) == "undefined") {
        obj[nodeName] = xmlToJson(item);
      } else {
        if (typeof(obj[nodeName].length) == "undefined") {
          var old = obj[nodeName];
          obj[nodeName] = [];
          obj[nodeName].push(old);
        }
        obj[nodeName].push(xmlToJson(item));
      }
    }
  }
  return obj;
};