import 'package:movie_moves/widgets/addmovie.dart';
import 'package:movie_moves/widgets/movieicon.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> paths = [];
  List<String> movies = [];
  List<String> directors = [];

  updateValues(String pth, String name, String dir, int editindex) {
    if (editindex == -1) {
      paths.add(pth);
      movies.add(name);
      directors.add(dir);
    } else {
      paths[editindex] = pth;
      movies[editindex] = name;
      directors[editindex] = dir;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "WATCHED",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddMovie(updatevalues: updateValues);
                        });
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 25.0),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 125.0,
                      child: EventGridItem(
                        imagePath: paths[index],
                        movieName: movies[index],
                        dirName: directors[index],
                      ),
                    ),
                  );
                }),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "UNWATCHED",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add, color: Colors.white, size: 25.0),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 125.0,
                      child: EventGridItem(),
                    ),
                  );
                }),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "RECOMMENDATIONS",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add, color: Colors.white, size: 25.0),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 125.0,
                      child: EventGridItem(),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
