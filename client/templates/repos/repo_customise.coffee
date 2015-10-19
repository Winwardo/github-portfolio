Template.orderRepos.helpers
	'allRepos': ->
		Repos.allForCurrentUser()
	'checkedIfActive': ->
		if @isActive then "checked" else ""

Template.orderRepos.rendered = ->
	$("#sortableRepos").sortable
		update: (event, ui) ->
			$("#sortableRepos > li").each (index) ->
				Meteor.call("setSortValue", $(this).data("id"), index)

Template.orderRepos.events
	'click .active': (e, template) ->
		isChecked = $(e.target).is(":checked")
		Meteor.call("setIsActive", this.data.id, isChecked)

Template.sync.events
	'click button': ->
		if Meteor.user()
			Meteor.call("syncRepos")