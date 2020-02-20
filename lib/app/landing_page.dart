import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/app/home_page.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({Key key, this.auth}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override
  void initState(){
    // initialization on page created.
    super.initState();
    _checkCurrentUser();

  }

  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser, // same as (user) => _updateUser(user),
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
      ); // temp placeholder for HomePage;
  }
}
