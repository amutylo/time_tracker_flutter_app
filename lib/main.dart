import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/app/landing_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';
import 'package:time_tracker_flutter_app/services/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(
          auth: Auth(),
        )
      ),
    );
  }
}
