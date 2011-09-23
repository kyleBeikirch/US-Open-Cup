$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "http://thecup.us/brackets/2011/us_open/data/2011bracket.xml",
        dataType: "xml",
        success: xmlParser
    });
});

function xmlParser(xml) {

	//console.log($(xml));
    $(xml).find("game").each(function() {
		
		console.log($(this).find("stadium"));
		$("#scoreHolder").append('<div class="scoreCard"></div>');
        //$(".main").append('<div class="book"><div class="title">' + $(this).find("Title").text() + '</div><div class="description">' + $(this).find("Description").text() + '</div><div class="date">Published ' + $(this).find("Date").text() + '</div></div>');
        //$(".book").fadeIn(1000);

    });

}