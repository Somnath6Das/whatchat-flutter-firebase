import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:whatchat/components/my_list_tile.dart';
import 'package:whatchat/components/search_bar.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/me_model.dart';
import 'package:whatchat/models/people_model.dart';
import 'package:whatchat/screens/messages.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PeopleModel>>(
        future: WhatChat.people(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  "People",
                  style: TextStyle(color: AppColors.primary),
                ),
                trailing: CupertinoButton(
                    child: const Icon(CupertinoIcons.person_add),
                    onPressed: () {}),
              ),
              SearchBar(
                onChanged: () {},
                onSubmitted: () {},
              ),
              const MyStatus(),
              Stories(snapshot: snapshot),
              PeopleList(
                snapshot: snapshot,
              ),
            ],
          );
        });
  }
}

class PeopleList extends StatelessWidget {
  final AsyncSnapshot<List<PeopleModel>> snapshot;
  const PeopleList({required this.snapshot, super.key});

  @override
  Widget build(BuildContext context) {
    return snapshot.hasData
        ? SliverList(
            delegate: SliverChildListDelegate(snapshot.data!
                .map((e) => MyListTile(
                    key: UniqueKey(),
                    image: e.avatar,
                    title: '${e.firstName} ${e.lastName}',
                    subtitle: e.status,
                    date: e.date,
                    border: false,
                    onTap: () => navigate(
                        context,
                        Messages(
                          contact: e.firstName,
                        )),
                    onImageTap: () => {}))
                .toList()),
          )
        : (snapshot.connectionState == ConnectionState.waiting)
            ? SliverFillRemaining(
                child: CupertinoActivityIndicator(
                  color: AppColors.primary,
                ),
              )
            : SliverFillRemaining(
                child: Center(
                child: Text(snapshot.error.toString()),
              ));
  }
}

class MyStatus extends StatelessWidget {
  const MyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<MeModel>(
          future: WhatChat.me(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              MeModel me = snapshot.data!;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.avatarBorder,
                              child: CircleAvatar(
                                radius: (me.story) ? 35 : 40,
                                backgroundImage: NetworkImage(me.avatar),
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  me.firstname,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  me.status,
                                  style: const TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                                onPressed: () {},
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: AppColors.primary,
                                )),
                            CupertinoButton(
                                onPressed: () {},
                                child: Icon(
                                  CupertinoIcons.pencil_ellipsis_rectangle,
                                  color: AppColors.primary,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey, thickness: 1)
                ],
              );
            }
            return Container();
          })),
    );
  }
}

class Stories extends StatelessWidget {
  final AsyncSnapshot<List<PeopleModel>> snapshot;
  const Stories({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Recent Updates'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // we don't need all the data from people model, if PeopleModel bool story is true then collect the dada.
                        children: snapshot.data!
                            .where((PeopleModel people) => (people.story))
                            .map(
                          (PeopleModel e) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: AppColors.avatarBorder,
                                    child: CircleAvatar(
                                      radius: (e.story) ? 35 : 40,
                                      backgroundImage: NetworkImage(e.avatar),
                                    ),
                                  ),
                                  Text(
                                    e.firstName,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    e.lastName,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  : (snapshot.connectionState == ConnectionState.waiting)
                      ? CupertinoActivityIndicator(
                          color: AppColors.primary,
                        )
                      : SliverFillRemaining(
                          child: Center(
                          child: Text(snapshot.error.toString()),
                        )),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1)
        ],
      ),
    );
  }
}
