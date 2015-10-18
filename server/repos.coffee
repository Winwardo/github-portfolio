Meteor.methods
	"syncRepos": ->
		console.log("Syncing repos");
		userId = Meteor.userId()
		user = Meteor.users.findOne userId
		gitusername = user.services.github.username

		github = new GitHub
			version: "3.0.0",
			timeout: 5000,

		result = github.repos.getFromUser
			user: gitusername

		sortedResult = _.sortBy result, (repo) -> -repo.stargazers_count

		Repos.remove({userId: userId})

		for x in [0...sortedResult.length]
			repo = sortedResult[x]
			Repos.insert
				userId: userId,
				data: repo,
				repoId: repo.id,
				isActive: false,
				sortId: x,

	"setIsActive": (repoId, isActive) ->
		Repos.upsert
			'userId': Meteor.userId(),
			'repoId': repoId
		,
			$set: 
				'isActive': isActive

	"setSortValue": (repoId, sortValue) ->
		Repos.upsert
			'userId': Meteor.userId(),
			'repoId': repoId
		,
			$set:
				'sortId': sortValue
				
			