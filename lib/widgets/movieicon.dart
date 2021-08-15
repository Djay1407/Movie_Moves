import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_moves/model/model.dart';
import 'package:movie_moves/widgets/addmovie.dart';

class EventGridItem extends StatelessWidget {
  const EventGridItem({Key key, this.movie, this.watched}) : super(key: key);
  final MovieItem movie;
  final bool watched;

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
            child: movie.imagePath != null
                ? Image.file(
                    File(movie.imagePath),
                    fit: BoxFit.fill,
                  )
                : const Placeholder(),
          ),
          Container(
            decoration: _buildGradientBackground(),
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //title in the last of each grid picture
                  movie.movieName,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                //director in the last of each grid picture
                Text(
                  movie.director,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            left: 5.0,
            child: InkWell(
              child:
                  const Icon(Icons.delete, color: Colors.white, size: 20.0),
              onTap: () {
                movie.delete();
              },
            ),
          ),
          Positioned(
            top: 10.0,
            right: 5.0,
            child: InkWell(
              child: const Icon(Icons.edit, color: Colors.white, size: 20.0),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddMovie(
                      mymovie: movie,
                      watched: watched,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

