import 'package:whatchat/models/story_model.dart';

class UserModel {
  final String userName;
  final String imageUrl;
  // this list of story model get from PeopleModel stories and convert into String by StoryModel.
  final List<StoryModel> stories;

  UserModel(this.stories, this.userName, this.imageUrl);
}
