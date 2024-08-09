import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

void showLoginModelSheet(BuildContext context){
   showModalBottomSheet(context: context, builder: (context) {
     return LoginSheet();
   },);
}

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {

  Future<UserCredential?> signInWithGoogle() async {
    try {
       // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Login Now",
              style: Theme.of(context).textTheme.headlineSmall,),
            ),
            Divider(),
            SizedBox(height: 3.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Material(
                      color: Colors.grey.shade200,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          signInWithGoogle();
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("Login with Google",
                            style: Theme.of(context).textTheme.labelLarge,)
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}