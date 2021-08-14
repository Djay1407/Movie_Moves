import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)  
class MovieItem extends HiveObject {
  @HiveField(0)
  final String movieName;

  @HiveField(1)
  final String director;

  @HiveField(3)
  final String imagePath;

  MovieItem({this.movieName, this.director, this.imagePath });
}