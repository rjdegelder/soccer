$ ->
  $('#match_home_team_name, #match_away_team_name').autocomplete
    source: (request, response) ->
      $.ajax(
        url: '/admin/teams',
        dataType: 'json',
        data: request,
        success: (json) ->
          response(json.map (team) ->
            { value: team.name, label: team.name, id: team.id }
          )
      )