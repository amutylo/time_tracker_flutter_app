import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:time_tracker_flutter_app/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController<bool>();


  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  ///Remove _isLoadingController when widget is removed from widget tree.
  void dispose() {
    _isLoadingController.close();
  }

  /// Same as adding isLoading variable to sink of _isLoadingController
  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch(e) {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<User> signInAnonymously() async => await _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  // Future<User> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);

}

