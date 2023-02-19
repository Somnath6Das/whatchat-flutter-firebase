import 'dart:convert';
import 'dart:io';
// import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_model_notifier/firebase_model_notifier.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:whatchat/firebase_options.dart';
import 'package:whatchat/firestore_models/users_data.dart';
import 'package:whatchat/global.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:whatchat/screens/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';

const bool useEmulator = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirestoreModel.injectAll([UserData()]);
  // await FirebaseApp.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //     settings: FirestoreModelSettings(
  //       persistenceEnabled: false,
  //     ));
  // if (useEmulator) {
  //   _connectToFirebaseEmulator();
  // }
  runApp(const MyApp());
}

// void _connectToFirebaseEmulator() async {
//   var firebaseConfig = await readJsonFile('firebase.json');
//   final fireStorePort = firebaseConfig['emulators']['firestore']['port'];
//   final authPort = firebaseConfig['emulators']['auth']['port'];
//   final storagePort = firebaseConfig['emulators']['storage']['port'];
//   final functionPort = firebaseConfig['emulators']['functions']['port'];

//   final localhost = Platform.isAndroid
//       ? '10.0.2.2'
//       : firebaseConfig['emulators']['storage']['port'];
//   await FirebaseStorage.instance.useStorageEmulator(localhost, storagePort);
//   await FirebaseAuth.instance.useAuthEmulator(localhost, authPort);
//   FirebaseFunctions.instance.useFunctionsEmulator(localhost, functionPort);
//   FirebaseFirestore.instance.useFirestoreEmulator(localhost, fireStorePort);
// }

// dynamic readJsonFile(String filePath) async {
//   final String response = await rootBundle.loadString(filePath);
//   return await json.decode(response);
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness? _brightness;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
 
  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          brightness: _brightness == Brightness.dark
              ? Brightness.dark
              : Brightness.light,
          primaryColor: AppColors.primary),
      home: const AuthGate(),
    );
  }
}
