import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:whatchat/my_home_page.dart';
import 'package:whatchat/screens/profile_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: ((context, constraints, shrinkOffset) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AspectRatio(
                      aspectRatio: 1, child: Image.asset('images/chat.png')),
                )),
            subtitleBuilder: (context, action) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: action == AuthAction.signIn
                  ? const Text('Welcome to whatChat, Please sign in!')
                  : const Text('Welcome to whatChat, Please sign up!'),
            ),
            footerBuilder: (context, action) => const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'By signing in, you agree to our terms and conditions.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            providerConfigs: const [PhoneProviderConfiguration()],
          );
        }
        if (FirebaseAuth.instance.currentUser?.displayName != null) {
          return MyHomePage();
        } else {
          return MyHomePage();
        }
      }),
    );
  }
}
