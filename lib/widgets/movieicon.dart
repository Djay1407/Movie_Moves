// import 'package:core/core.dart';
// import 'package:movie_moves/Screens/bookpage.dart';
// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';

class EventGridItem extends StatelessWidget {
  const EventGridItem({Key key, this.imagePath, this.movieName, this.dirName})
      : super(key: key);
  final String imagePath;
  final String movieName;
  final String dirName;

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        //to give black highlight on bottom of pic to make text visible
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.7, 0.7],
        colors: [
          Colors.black,
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5.0,
            child: imagePath != null
                ? Image.file(
                    File(imagePath),
                    height: 200.0,
                    width: 125.0,
                    fit: BoxFit.fill,
                  )
                : const Placeholder(),
          ),
          // EventPoster(event: event),
          Container(
            decoration: _buildGradientBackground(),
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  //title in the last of each grid picture
                  "title",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                    height: 4.0), //director in the last of each grid picture
                Text(
                  "director",
                  // event.directors,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 10.0,
            left: 5.0,
            child: Visibility(
                visible: true,
                child: InkWell(
                  child: Icon(Icons.delete, color: Colors.white, size: 20.0),
                  onTap: null,
                )),
          ),
          const Positioned(
            top: 10.0,
            right: 5.0,
            child: Visibility(
                visible: true,
                child: InkWell(
                  child: Icon(Icons.edit, color: Colors.white, size: 20.0),
                  onTap: null,
                )),
          ),
        ],
      ),
    );
  }
}

// class _TextualInfo extends StatelessWidget {
  
  

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
