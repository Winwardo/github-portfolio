Meteor.methods
	"syncUser": (username) ->
		result = github.user.getFrom
			"user": username

		GithubUsers.upsert
			"id": result.id
		,
			result