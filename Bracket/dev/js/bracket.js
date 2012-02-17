// load JSON Data file
$(document).ready(function(){
    $.getJSON("data/bracket.json",
        function(data){
            console.log(data);
        });
  });