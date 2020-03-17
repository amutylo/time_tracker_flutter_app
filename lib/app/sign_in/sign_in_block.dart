import 'dart:async';

class SignInBloc {
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  ///Remove _isLoadingController when widget is removed from widget tree.
  void dispose() {
    _isLoadingController.close();
  }

  /// Same as adding isLoading variable to sink of _isLoadingController
  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);
}

