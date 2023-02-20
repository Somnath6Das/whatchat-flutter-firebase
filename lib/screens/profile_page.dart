import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:whatchat/firestore_models/users_data.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/screens/auth_gate.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _textName = TextEditingController();
  final _textStatus = TextEditingController();

  @override
  void initState() {
    checkUser();
    print('profile page');
    super.initState();
  }

  void checkUser() async {
    bool isExists = await FirestoreModel.use<UserData>()
        .exists(FirebaseAuth.instance.currentUser!.uid);
    try {
      if (!isExists) {
        UserData.init(
                uid: FirebaseAuth.instance.currentUser!.uid,
                mobile: FirebaseAuth.instance.currentUser!.phoneNumber,
                accountCreated: true)
            .create();
      }
    } catch (err) {
      FirebaseAuth.instance.signOut();
      navigate(context, const AuthGate());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ModelStreamSingleBuilder<UserData>(
      onLoading: () => const Center(child: Text('Loading information')),
      onError: (error) => const Center(child: Text('Some error occurred!')),
      docId: FirebaseAuth.instance.currentUser?.uid,
      onSuccess: (user) {
        _textName.text = user?.name ?? '';
        _textStatus.text = user?.status ?? '';
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user != null
                ? SizedBox(
                    width: 200,
                    child: AspectRatio(
                        aspectRatio: 1, child: Image.asset('images/speak.png')),
                  )
                : Container(),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.avatarBorder,
              child: user?.avatar != null
                  ? CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(user!.avatar!),
                    )
                  : Container(),
            ),
          ],
        );
      },
    ));
  }
}
