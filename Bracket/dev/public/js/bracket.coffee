dataLoaded = ->
  arrangeGames()
  
  
arrangeGames = ->  
  # lopps through each round calculates number of games in round and spaces games vertically
  padding = 54
  $('.roundHolder').each (i, element)  =>
    $(element).css('left', i * 120)
    numGames = $('.bracketGame', element).length
    marginAdjust = (padding * (16/numGames)) + padding + (padding/2 * ((16/numGames)-1))
    
    $('.bracketGame', element).each (i, element)  =>
      topPos = (i * (padding * (16/numGames)) + padding + (padding/2 * ((16/numGames)-1)))-10;
      $(element).css('top', topPos)
      

$(document).ready ->
  # load json data
  $.getJSON "data/bracket.json", (data) ->
    # put data in mustache template
    $("#Main").html Mustache.to_html($("#spread-template").html(),
      bracketData: data
    )
    dataLoaded()