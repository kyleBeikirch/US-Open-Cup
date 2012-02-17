// load JSON Data file
$(document).ready(function(){
    $.getJSON("data/bracket.json",
        function(data){
          console.log($('#Main'));
          $('#Main').html(Mustache.to_html($('#spread-template').html(), {
              bracketData: data
          }));
        });
  });