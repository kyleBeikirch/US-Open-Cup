dataLoaded = ->
  arrangeGames()
  
  
arrangeGames = ->  
  # lopps through each round calculates number of games in round and spaces games vertically
  $('.roundHolder').each (i, element)  =>
    numGames = $('.bracketGame', element).length
    marginAdjust = (17 * ((16/numGames)-1))  + 10
    $('.bracketGame', element).each (i, element)  =>
      # $(element).css('margin-top', marginAdjust)
      

$(document).ready ->
  # load json data
  $.getJSON "data/bracket.json", (data) ->
    # put data in mustache template
    $("#Main").html Mustache.to_html($("#spread-template").html(),
      bracketData: data
    )
    dataLoaded()