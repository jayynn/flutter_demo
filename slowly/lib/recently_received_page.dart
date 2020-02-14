import 'package:flutter/material.dart';

class RecentlyReceivedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15.0, top: 115.0),
              child: SizedBox(
                child: Image.asset('assets/images/logo.jpg'),
                height: 90.0,
              ),
            ),
            Text(
              'Recently Received',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
