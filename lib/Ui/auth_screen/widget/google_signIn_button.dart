import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_text.dart';
import '../../../data/http_helper/http_helper.dart';
import '../../../data/prefs_helper/prefs_helper.dart';
import '../../../data/repository/repository.dart';
import '../../../injectoin.dart';
import '../bloc/auth_bloc.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
   FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<User?> _signInWithGoogle() async {
    try {
      setState(() {
        _isSigningIn=true;
      });
       GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User aborted the sign-in
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      final _bloc = sl<AuthBloc>();

      _bloc.add(TryLoginWithGoogle((b) => b..name=user?.displayName??''..email= user?.email??''
      ..phone=user?.phoneNumber??''..uId=user?.uid??''
      ));
      setState(() {
        _isSigningIn=false;
      });
      // return user;
    } catch (e) {
      print(e);
      setState(() {
        _isSigningIn=false;
      });
      return null;
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child:

      IconWidget(
        radius: 12,
        onTap: ()async{
          User? user = await _signInWithGoogle();
          if (user != null) {
            print('Sign-in successful: ${user.displayName}');
          } else {
            print('Sign-in failed');
          }
        },
        widget:


        Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30),
          //   border: Border.all(color: Colors.black26)
          // ),
          width: MediaQuery.sizeOf(context).width*0.9,
          padding: 2.paddingVert,
          child:  Padding(
            padding:  EdgeInsets.only(top: 6.h,left: 0.w,right: 0.w,bottom: 6.h),
            child:
            _isSigningIn==true?
                loader():
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/google.png"),
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                  child:
                  baseText(AppLocalizations.of(context)
                      .translate("Sign_Google"),)

                )
              ],
            ),
          ),
        ),
      )
    );
  }
}