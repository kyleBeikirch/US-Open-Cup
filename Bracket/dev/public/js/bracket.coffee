bracketHeight = 0
gameData = []
overlayData = []
teamsData = []

showOverlay = (data) ->
  $('#Overlay').fadeIn()  
  $("#Ovarlay-content").html Mustache.to_html($("#overlay-template").html(),
    overlayData: data
  )
  
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
      bracketHeight = Math.max bracketHeight , topPos
      $(element).css('top', topPos)
      $(element).click =>
        gameID = $(element).attr('data-id')
        for round of gameData
          roundData = gameData[round].game
          for game of roundData
            overlayData = roundData[game]  if roundData[game].id is gameID
        showOverlay(overlayData)     

$(document).ready ->
  # load json data
  $.getJSON "data/bracket.json", (data) ->
    # put data in mustache template
    gameData = data.bracket.round
    $("#Main").append Mustache.to_html($("#spread-template").html(),
      bracketData: data
    )
    dataLoaded()
    
    $.getJSON "data/teams.json", (data) ->
      teamsData = data
      # put data in mustache template
      $("#Main").append Mustache.to_html($("#teams-template").html(),
        teamData: data
      )
      
      $('#teamSheet').css( 'top', bracketHeight + 120)
      $(".leagueTeam").each (i, element) ->
        $(element).css "text-decoration", "line-through"  if $(element).attr("data-active") is 'false'
    $('#Overlay-close').click ->
      $('#Overlay').fadeOut()