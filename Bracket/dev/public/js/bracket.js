// Generated by CoffeeScript 1.2.1-pre
(function() {
  var arrangeGames, bracketHeight, dataLoaded;

  bracketHeight = 0;

  dataLoaded = function() {
    return arrangeGames();
  };

  arrangeGames = function() {
    var padding,
      _this = this;
    padding = 54;
    return $('.roundHolder').each(function(i, element) {
      var marginAdjust, numGames;
      $(element).css('left', i * 120);
      numGames = $('.bracketGame', element).length;
      marginAdjust = (padding * (16 / numGames)) + padding + (padding / 2 * ((16 / numGames) - 1));
      return $('.bracketGame', element).each(function(i, element) {
        var topPos;
        topPos = (i * (padding * (16 / numGames)) + padding + (padding / 2 * ((16 / numGames) - 1))) - 10;
        bracketHeight = Math.max(bracketHeight, topPos);
        return $(element).css('top', topPos);
      });
    });
  };

  $(document).ready(function() {
    return $.getJSON("data/bracket.json", function(data) {
      $("#Main").html(Mustache.to_html($("#spread-template").html(), {
        bracketData: data
      }));
      dataLoaded();
      return $.getJSON("data/teams.json", function(data) {
        $("#Main").append(Mustache.to_html($("#teams-template").html(), {
          teamData: data
        }));
        return $('#teamSheet').css('top', bracketHeight + 120);
      });
    });
  });

}).call(this);
