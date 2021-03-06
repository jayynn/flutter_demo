import 'package:flutter/material.dart';

import 'package:despicables_me_app/styleguide.dart';
import 'package:despicables_me_app/widgets/character_widget.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Despicable Me', style: AppTheme.display1),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Characters', style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CharacterWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
