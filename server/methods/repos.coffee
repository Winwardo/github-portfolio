Meteor.methods
	"clearRepos": ->
		console.log "byebye"
		Repos.remove
			username: Users.getCurrentUsername()

	"syncRepos": ->
		userId = Meteor.userId()
		user = Meteor.users.findOne userId
		gitusername = user.services.github.username
		Meteor.call "syncReposForUsername", gitusername

	"syncReposForUsername": (username) ->
		result = github.repos.getFromUser
			user: username

		sortedResult = _.sortBy result, (repo) -> -repo.stargazers_count

		Repos.remove
			username: new RegExp(username, "i")

		for x in [0...sortedResult.length]
			repo = sortedResult[x]
			Repos.insert
				username: username,
				data: repo,
				repoId: repo.id,
				isActive: x < 5, # Automatically show the first 5 repositories
				sortId: x,

	"setIsActive": (repoId, isActive) ->
		Repos.update
			'username': Users.getCurrentUsername(),
			'repoId': repoId
		,
			$set: 
				'isActive': isActive

	"setSortValue": (repoId, sortValue) ->
		Repos.update
			'username': Users.getCurrentUsername(),
			'repoId': repoId
		,
			$set:
				'sortId': sortValue
				
	"updateRepoInfo": (repoId, isActive, sortValue, description, imageUrl) ->
		Repos.update
			'username': Users.getCurrentUsername(),
			'repoId': repoId
		,
			$set:
				'isActive': isActive,
				'sortId': sortValue,
				'description': description,
				'imageUrl': imageUrl


