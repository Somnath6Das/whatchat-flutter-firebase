import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/user_model.dart';

class StoryPreview extends StatefulWidget {
  final pageIndex;
  final List<UserModel> users;

  const StoryPreview({
    super.key,
    this.pageIndex,
    required this.users,
  });

  @override
  State<StoryPreview> createState() => _StoryPreviewState(pageIndex, users);
}

class _StoryPreviewState extends State<StoryPreview> {
  final pageIndex;
  final List<UserModel> sampleUsers;
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  _StoryPreviewState(this.pageIndex, this.sampleUsers);

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: StoryPageView(
        itemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
          final user = sampleUsers[pageIndex];
          // per user story at a time
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color: Colors.black,
              )),
              Positioned.fill(
                  child: Image.network(
                story.imageUrl,
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 44),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(user.imageUrl),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user.userName,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          );
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        initialStoryIndex: (int pageIndex) {
          return 0;
        },
        initialPage: pageIndex,
        onPageLimitReached: () {
          pop(context);
        },
        indicatorAnimationController: indicatorAnimationController,
      ),
    ));
  }
}
