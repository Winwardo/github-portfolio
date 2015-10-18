Template.sync.events
	'click button': ->
		if Meteor.user()
			Meteor.call("syncRepos")

Template.activeRepos.helpers
	'activeRepos': ->
		Repos.activeForUser()

Template.orderedRepos.events
	'click .active': (e, template) ->
		isChecked = $(e.target).is(":checked")
		Meteor.call("setIsActive", this.data.id, isChecked)