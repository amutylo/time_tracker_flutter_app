import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/app/home_page.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';
import 'package:time_tracker_flutter_app/services/auth_provider.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          User user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          return HomePage(); // temp placeholder for HomePage;
        }
        else {
          return Scaffold(
             body: Center(
               child: CircularProgressIndicator(),
             ),
          );
        }
      },
    );
  }
}
