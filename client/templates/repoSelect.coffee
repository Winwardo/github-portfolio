Template.orderedRepos.helpers
	'orderedRepos': ->
		Repos.allForUser()
	'checkedIfActive': ->
		if @isActive then "checked" else ""

Template.orderedRepos.rendered = ->
	$("#sortableRepos").sortable
		update: (event, ui) ->
			$("#sortableRepos > li").each (index) ->
				Meteor.call("setSortValue", $(this).data("id"), index)