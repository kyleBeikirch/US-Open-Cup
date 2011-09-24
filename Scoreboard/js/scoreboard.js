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
	console.log(teamData);
	
	
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
		var awayID = $(this).find("awayID").text();
		var awayData = teamData[awayID];
		var awayName = awayData.name[0].Text;
		$("#scoreHolder").append('<div class="scoreCard"><div class="title">' + $(this).find("date").text() + '</div><div class="home">' + homeName + '</div><div class="away"> ' + awayName + '</div></div>');

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