import 'package:flutter/material.dart';

import 'package:despicables_me_app/models/character.dart';
import 'package:despicables_me_app/pages/character_detail_screen.dart';
import 'package:despicables_me_app/styleguide.dart';


class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 350),
          pageBuilder: (context, _, __) => CharacterDetailScreen(character: characters[0])
        ));
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag: 'background-${characters[0].name}',
                child: Container(
                  width: 0.9 * screenWidth,
                  height: 0.6 * screenHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: characters[0].colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Hero(
              tag: 'image-${characters[0].name}',
              child: Image.asset(
                characters[0].imagePath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 32, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'name-${characters[0].name}',
                  child: Text(
                    characters[0].name,
                    style: AppTheme.heading,
                  ),
                ),
                Hero(
                  tag: 'desc-${characters[0].name}',
                  child: Text(
                    'Tap to Read more',
                    style: AppTheme.subHeading,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clipperPath = Path();
    double curveDistance = 40;

    clipperPath.moveTo(0, size.height * 0.4);
    clipperPath.lineTo(0, size.height - curveDistance);
    clipperPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clipperPath.lineTo(size.width - curveDistance, size.height);
    clipperPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clipperPath.lineTo(size.width, 0 + curveDistance);
    clipperPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3.0);
    clipperPath.lineTo(curveDistance, size.height * 0.29);
    clipperPath.quadraticBezierTo(
        1, size.height * 0.30 + 10.0, 0, size.height * 0.4);

    return clipperPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
