import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:movie_moves/model/model.dart';
//Edit this file to take movie
class AddMovie extends StatefulWidget {
  const AddMovie({Key key, this.mymovie, @required this.watched}) : super(key: key);
  final MovieItem mymovie;
  final bool watched;

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController movieNameController = TextEditingController();
  TextEditingController directorNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile image;
  Box<MovieItem> box;

  void getImage() async {
    final _pickedimage = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedimage != null) {
      setState(
        () {
          image = _pickedimage;
        },
      );
    } else {
      debugPrint('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    box = Hive.box<MovieItem>(widget.watched?"watched":"towatch");
    if (widget.mymovie != null) {
      movieNameController.text = widget.mymovie.movieName;
      directorNameController.text = widget.mymovie.director;
      image = XFile(widget.mymovie.imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.grey.shade900,
      title: const Text("Add Movie"),
      titleTextStyle: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w700,
        color: Colors.white70,
      ),
      children: [
        Center(
          child: Container(
            color: Colors.white70,
            height: 250.0,
            width: 150.0,
            child: image == null
                ? Center(
                    child: IconButton(
                        onPressed: () {
                          getImage();
                        },
                        icon: const Icon(Icons.camera_alt)),
                  )
                : Stack(
                    children: [
                      Image.file(
                        File(image.path),
                        height: 250.0,
                        width: 150.0,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 10.0,
                        right: 5.0,
                        child: Visibility(
                          visible: true,
                          child: InkWell(
                            child: const Icon(Icons.camera_alt,
                                color: Colors.white, size: 20.0),
                            onTap: () {
                              getImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                " Movie Name",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(height: 5.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    controller: movieNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 18.0,
                        color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name the movie",
                      hintStyle: TextStyle(
                          fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                " Director",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(height: 5.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    controller: directorNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 18.0,
                        color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name of the director",
                      hintStyle: TextStyle(
                          fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 17.0, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                if (image != null &&
                    movieNameController.text != "" &&
                    directorNameController.text != "") {
                  MovieItem temp = MovieItem(
                      movieName: movieNameController.text,
                      director: directorNameController.text,
                      imagePath: image.path);
                  if (widget.mymovie == null) {
                    box.add(temp);
                  } else {
                    box.put(widget.mymovie.key, temp);
                  }
                }
                Navigator.pop(context);
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 17.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
