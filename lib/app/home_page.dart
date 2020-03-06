import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_app/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout'
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize:18.0,
                color: Colors.white,
              )
            ),
            onPressed: () => _confirmSignOut(context)
          )
        ],
      ),
    );
  }
}
