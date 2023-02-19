import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/my_home_page.dart';

enum LoginScreen {
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET,
}

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String verificationID = "";

  void signInWithPhoneAuthCred(BuildContext context,AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
      
        navigate(context, const MyHomePage());
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      CupertinoPopupSurface(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: Text(
            'Some error Occured!\n${e.message}',
            style: TextStyle(
              fontSize: 14.0,
              color: CupertinoColors.secondaryLabel,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  showMobilePhoneWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
       const Text(
          "Verify Your Phone Number",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
       const SizedBox(
          height: 20,
        ),
        Center(
          child: CupertinoTextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            placeholder: "Phone number.",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CupertinoButton(
            child: const Text("Send OTP"),
            onPressed: () async {
              await _auth.verifyPhoneNumber(
                  phoneNumber: "+91${phoneController.text}",
                  verificationCompleted: (phoneAuthCredential) async {},
                  verificationFailed: (verificationFailed) {
                    print(verificationFailed);
                  },
                  codeSent: (verificationID, resendingToken) async {
                    setState(() {
                      currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                      this.verificationID = verificationID;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationID) async {});
            }),
       const SizedBox(
          height: 16,
        ),
       const Spacer()
      ],
    );
  }

  showOtpFromWidget(context, var otp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          "Enter Your OTP",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 20,
        ),
        OtpTextField(
          numberOfFields: 6,
          fillColor: Colors.grey,
          filled: true,
          onSubmit: (code) {
            otp = code;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CupertinoButton(
            onPressed: () {
              AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                  verificationId: verificationID, smsCode: otp);
              signInWithPhoneAuthCred(context, phoneAuthCredential);
            },
            child: const Text("Verify")),
        const SizedBox(
          height: 16,
        ),
        const Spacer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var otp = '';
    return CupertinoPageScaffold(
      child: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET
          ? showMobilePhoneWidget(context)
          : showOtpFromWidget(context, otp),
    );
  }
}
