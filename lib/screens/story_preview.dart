import 'package:flutter/cupertino.dart';
import 'package:whatchat/models/user_model.dart';

class StoryPreview extends StatefulWidget {
  final pageIndex;
  final List<UserModel> users;
  const StoryPreview({super.key, this.pageIndex,required this.users});

  @override
  State<StoryPreview> createState() => _StoryPreviewState(pageIndex, users);
}

class _StoryPreviewState extends State<StoryPreview> {
   final pageIndex;
  final List<UserModel> sampleUsers;

  _StoryPreviewState(this.pageIndex, this.sampleUsers);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(pageIndex.toString()),
      ),
    );
  }
}
