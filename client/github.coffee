Template.sync.events
	'click button': ->
		if Meteor.user()
			Meteor.call("syncRepos")

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

Template.activeRepos.helpers
	'activeRepos': ->
		Repos.activeForUser()

Template.orderedRepos.events
	'click .active': (e, template) ->
		isChecked = $(e.target).is(":checked")
		Meteor.call("setIsActive", this.data.id, isChecked)