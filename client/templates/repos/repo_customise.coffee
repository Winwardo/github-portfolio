Template.orderRepos.helpers
	'allRepos': ->
		Repos.allForCurrentUser()
	'checkedIfActive': ->
		if @isActive then "checked" else ""

Template.orderRepos.rendered = ->
	$("#sortableRepos tbody").sortable(
		helper: (e, ui) -> # http://www.foliotek.com/devblog/make-table-rows-sortable-using-jquery-ui-sortable/
			ui.children().each ->
				$(@).width($(@).width())
			ui
		)

Template.orderRepos.events
	'click #save': ->
		NProgress.start()
		$("#sortableRepos tbody tr").each (index) ->
			t = $(@)

			id = t.data("id")
			isChecked = t.find(".active").is(":checked")
			description = t.find(".description").val()
			imageUrl = t.find(".imageUrl").val()

			Meteor.call "updateRepoInfo", id, isChecked, index, description, imageUrl
		NProgress.done()
	'click #resync': ->
		Meteor.call("syncRepos")
	'click #delete': ->
		console.log "what"
		Meteor.call("clearRepos")

Template.sync.events
	'click button': ->
		if Meteor.user()
			Meteor.call("syncRepos")