getParameterByName = (name) ->
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  regexS = "[\\?&]" + name + "=([^&#]*)"
  regex = new RegExp(regexS)
  results = regex.exec(window.location.search)
  unless results?
    ""
  else
    decodeURIComponent results[1].replace(/\+/g, " ")
    
currentYear = getParameterByName("year")
currentRound = getParameterByName("round")

loadData = () ->
  # load json data
  $.getJSON "data/bracket" + currentYear + ".json", (data) ->
    # put data in mustache template
    gameData = data.bracket.round[currentRound-1]
    numGames =  gameData.game.length
    console.log gameData
    $("#listContent").append Mustache.to_html($("#gameList-template").html(),
      scoreboardData: gameData
    )

$(document).ready ->
  loadData()
 
