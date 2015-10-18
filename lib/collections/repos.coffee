@Repos = new Meteor.Collection "repos"

Repos.allForUser = ->
	Repos.find
		userId: Meteor.userId(),
	,
		sort:
			sortId: 1,
			full_name: 1
Repos.activeForUser = ->
	Repos.find
		userId: Meteor.userId(),
		isActive: true,
	,
		sort:
			sortId: 1,
			full_name: 1