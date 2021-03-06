bracketHeight = 0
gameData = []
overlayData = []
teamsData = []
currentYear = 0

getParameterByName = (name) ->
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  regexS = "[\\?&]" + name + "=([^&#]*)"
  regex = new RegExp(regexS)
  results = regex.exec(window.location.search)
  unless results?
    ""
  else
    decodeURIComponent results[1].replace(/\+/g, " ")
    
    
showOverlay = (data) ->
  moveOverlay = $(window).height() / 2 - ($('#Overlay').height() / 2) + $(window).scrollTop()
  $('#Overlay').css('top', moveOverlay)
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
        if overlayData.link isnt ""
          window.open overlayData.link, "_blank"
        else showOverlay overlayData  if overlayData.awayName isnt ""  && overlayData.homeName isnt ""

$(document).ready ->
  theDate = new Date();
  time = theDate.valueOf();
  currentYear = getParameterByName("year")
  # load json data
  $.getJSON "data/bracket" + currentYear + ".json?" + time, (data) ->
    # put data in mustache template
    gameData = data.bracket.round
    $("#Main").append Mustache.to_html($("#spread-template").html(),
      bracketData: data
    )
    dataLoaded()
    
    # $("#Main").append('<div id="disclaimer">* Bracket arrangement subject to change - matchups fixed through Quarterfinals</div>')
    $('#disclaimer').css( 'top', bracketHeight + 130)
    
    $.getJSON "data/teams.json?"  + time, (data) ->
      teamsData = data
      # put data in mustache template
      $("#Main").append Mustache.to_html($("#teams-template").html(),
        teamData: data
      )
      
      $('#teamSheet').css( 'top', bracketHeight + 140)
      $(".leagueTeam").each (i, element) ->
        # When eliminated, cross out on team sheet
        $(element).css "color", "#999"  if $(element).attr("data-lastMan").indexOf(currentYear) is -1
        #Hide if team is not particpating this year
        $(element).remove() if $(element).attr("data-participant").indexOf(currentYear.toString()) is -1
      #If no teams from that league are in it,then hide them
      $(".leagueHolder").each (i, element) ->
        $(element).remove() if $(element).children().length is 1
        if $(element).children().length is 2
          $(element).css "float", "right" 
          $(element).css "margin-right", "70px"
          $(element).css "margin-top", "-50px" 
    $('#Overlay-close').click ->
      $('#Overlay').fadeOut()