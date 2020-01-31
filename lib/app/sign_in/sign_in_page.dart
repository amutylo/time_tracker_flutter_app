import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time tracker'),
        elevation: 2.0,
      ),
      body: _buildContent()
    );
  }

  // Build content for the body of scaffold widget
  Widget _buildContent() {
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
            SizedBox(height: 8.0),
            Container(
              color: Colors.blueAccent,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              color: Colors.purple,
              child: SizedBox(
                height: 100.0,
              ),
            ),
          ],
        ),
      );
  }
}
