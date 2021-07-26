import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase authBase;
  const HomePage({
    Key key,
    @required this.authBase,
  }) : super(key: key);

  Future<void> _signOut() async {
    try {
      await authBase.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: _signOut,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
