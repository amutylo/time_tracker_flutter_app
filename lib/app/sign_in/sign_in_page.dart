import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth});
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _sighInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time tracker'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  // Build content for the body of scaffold widget
  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              )
              ),
            SizedBox(height: 48.0),
            SocialSignInButton(
              assetName: 'images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: _signInWithGoogle,
            ),
            SizedBox(height: 8.0),
            SocialSignInButton(
              assetName: 'images/facebook-logo.png',
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
              onPressed: () {},
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Sign in with email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () => _sighInWithEmail(context),
            ),
            SizedBox(height: 8.0),
            Text(
              'or',
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              textAlign: TextAlign.center,
             ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Go anonymouse',
              textColor: Colors.black,
              color: Colors.lime[300],
              onPressed: _signInAnonymously,
            ),
          ],
        ),
      );
  }
}
