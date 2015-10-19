@GithubUsers = new Meteor.Collection("githubUsers")

GithubUsers.forUser = (username) ->
	GithubUsers.findOne
		"login": new RegExp(username, "i")