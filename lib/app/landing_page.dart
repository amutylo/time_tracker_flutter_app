import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_app/app/home_page.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Provider is a generic class so always specify the type of object
    // in angular brakets
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          User user = snapshot.data;
          if (user == null) {
            return SignInPage.create(context);
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
