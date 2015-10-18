var Repos = new Meteor.Collection("repos");

Template.hello.events({
  'click button': function () {
    var user = Meteor.user()
    if (user) {
      Meteor.call("syncRepos")
    }
  }
});

Template.repos.helpers({
  'allRepos': function() {
    return Repos.findOne({userId: Meteor.userId()}).repos
  }
})

Template.orderedRepos.helpers({
  'orderedRepos': function() {
    return Repos.find({userId: Meteor.userId()}, {sort: {sortId: 1, full_name: 1}})
  },
  'checkedIfActive': function() {
    return this.isActive ? "checked" : "";
  }
})

Template.orderedRepos.rendered = function() {
  $("#sortableRepos").sortable({
    update: function(event, ui) {
      $("#sortableRepos > li").each(function(index, o) {
        Meteor.call("setSortValue", $(this).data("id"), index)
      })
    }
  })
}

Template.activeRepos.helpers({
  'activeRepos': function() {
    return Repos.find({userId: Meteor.userId(), isActive: true}, {sort: {sortId: 1, full_name: 1}})
  }
})

Template.orderedRepos.events({
  'click .active': function(e, template){
    var isChecked = $(e.target).is(":checked")

    Meteor.call("setIsActive", this.data.id, isChecked);

  }
})