
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({@required this.auth, @required this.child});
  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  // final auth = AuthProvider.of(context);
  static AuthBase of(BuildContext context) {
    AuthProvider provider = context.dependOnInheritedWidgetOfExactType();
    return provider.auth;
  }
}
