myScroll = null
currentElement = 1
timeSlide = 200
numGames = 0;

getParameterByName = (name) ->
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  regexS = "[\\?&]" + name + "=([^&#]*)"
  regex = new RegExp(regexS)
  results = regex.exec(window.location.search)
  unless results?
    ""
  else
    decodeURIComponent results[1].replace(/\+/g, " ")

$(document).ready ->
  currentYear = getParameterByName("year")
  currentRound = getParameterByName("round")
  # load json data
  $.getJSON "data/bracket" + currentYear + ".json", (data) ->
    # put data in mustache template
    gameData = data.bracket.round[currentRound-1]
    numGames =  gameData.game.length
    $("#thelist").append Mustache.to_html($("#scoreboard-template").html(),
      scoreboardData: gameData
    )
    
    myScroll = new iScroll('wrapper', { bounceLock: true, hScrollbar: false, vScrollbar: false, snap: true});
    
    $("#nextBtn").click ->
      currentElement++
      currentElement = Math.min(numGames - 2, currentElement)
      myScroll.scrollToElement('li:nth-child(' + currentElement + ')', timeSlide)
    $("#prevBtn").click ->
      currentElement--
      currentElement = Math.max(1, currentElement)
      myScroll.scrollToElement('li:nth-child(' + currentElement + ')', timeSlide)