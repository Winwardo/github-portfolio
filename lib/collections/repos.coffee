@Repos = new Meteor.Collection "repos"

@Schemas = {}
Schemas.Repo = new SimpleSchema
	username:
		type: String
		label: "Username"
	data:
		type: Object
		label: "Repo information"
		blackbox: true
	repoId:
		type: Number
		label: "Id of repo, as given by GitHub"
	isActive:
		type: Boolean
		label: "Should this repo be displayed"
	sortId:
		type: Number

Repos.attachSchema(Schemas.Repo)


Repos.activeForGivenUser = (username) ->
	Repos.find
		"username": username,
		isActive: true,
	,
		sort:
			sortId: 1,
			full_name: 1

Repos.allForCurrentUser = ->
	Repos.find
		"username": Users.getCurrentUsername(),
	,
		sort:
			sortId: 1,
			full_name: 1