import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_moves/model/model.dart';
import 'package:movie_moves/widgets/addmovie.dart';
import 'package:movie_moves/widgets/movieicon.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Box<MovieItem> box1;
  Box<MovieItem> box2;

  @override
  void initState() {
    super.initState();
    box1 = Hive.box<MovieItem>("watched");
    box2 = Hive.box<MovieItem>("towatch");
    // box.clear();
  }

  @override
  void dispose() {
    super.dispose();
    // Hive.close();
  }

  @override
  Widget build(BuildContext context) {

    final _addMovieMessage = Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "No Movies Added !!",
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 30.0),
        ),
        const SizedBox(height: 5.0,),
        Text(
          'Tap on "+" icon to add now',
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 20.0),
        ),
      ],
    ),
  );

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "WATCHED",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddMovie(
                        watched: true,
                      );
                    },
                  );
                },
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor, size: 25.0),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 250.0,
            child: ValueListenableBuilder(
              valueListenable: box1.listenable(),
              builder: (BuildContext context, Box<MovieItem> box, _) {
                List<int> keys = box.keys.cast<int>().toList();
                if (keys.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final key = keys[index];
                      final MovieItem movie = box.get(key);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150.0,
                          child: EventGridItem(
                            movie: movie,
                            watched: true,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return _addMovieMessage;
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TO WATCH",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddMovie(
                        watched: false,
                      );
                    },
                  );
                },
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor, size: 25.0),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 250.0,
            child: ValueListenableBuilder(
              valueListenable: box2.listenable(),
              builder: (BuildContext context, Box<MovieItem> box, _) {
                List<int> keys = box.keys.cast<int>().toList();
                if (keys.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final key = keys[index];
                      final MovieItem movie = box.get(key);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150.0,
                          child: EventGridItem(
                            movie: movie,
                            watched: false,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return _addMovieMessage;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
