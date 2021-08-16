import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io';
import 'package:movie_moves/model/model.dart';
// import 'dart:developer';

//Edit this file to take movie
class AddMovie extends StatefulWidget {
  const AddMovie({Key key, this.mymovie, @required this.watched})
      : super(key: key);
  final MovieItem mymovie;
  final bool watched;

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController movieNameController = TextEditingController();
  TextEditingController directorNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File image;
  Box<MovieItem> box;

  final _movieNameFormKey = GlobalKey<FormState>();
  final _directorNameFormKey = GlobalKey<FormState>();

  void getImage() async {
    final dir = await path_provider.getApplicationDocumentsDirectory();
    final posterDirectory = Directory(dir.path + "/images");

    if (!(await posterDirectory.exists())) {
      posterDirectory.create();
    }
    final _pickedimage = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedimage != null) {
      String filename = _pickedimage.name;
      final oldFile = File(_pickedimage.path);
      final newImage =
          await oldFile.copy(posterDirectory.path + '/' + filename);
          // log(newImage.path);
          // log(oldFile.path);
      setState(
        () {
          image = newImage;
        },
      );
    } else {
      // log('No image selected.');
    }
  }

  String _customMovieNameValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter movie name';
    }
    return null;
  }

  String _customDirectorNameValidator(String value) {
    if (value == null || value.isEmpty) {
      return "Please enter Director's name";
    }
    return null;
  }

  Widget _invalidPosterAlert(BuildContext context) {
    return AlertDialog(
      title: const Text('Invalid Poster!'),
      content: const Text('Please select a poster Image.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    box = Hive.box<MovieItem>(widget.watched ? "watched" : "towatch");
    if (widget.mymovie != null) {
      movieNameController.text = widget.mymovie.movieName;
      directorNameController.text = widget.mymovie.director;
      image = File(widget.mymovie.imagePath);
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
                  child: Form(
                    key: _movieNameFormKey,
                    child: TextFormField(
                      validator: _customMovieNameValidator,
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
                  child: Form(
                    key: _directorNameFormKey,
                    child: TextFormField(
                      validator: _customDirectorNameValidator,
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
                if (image == null) {
                  showDialog(context: context, builder: _invalidPosterAlert);
                } else if (_movieNameFormKey.currentState.validate() &&
                    _directorNameFormKey.currentState.validate()) {
                  MovieItem temp = MovieItem(
                      movieName: movieNameController.text,
                      director: directorNameController.text,
                      imagePath: image.path);
                  if (widget.mymovie == null) {
                    box.add(temp);
                  } else {
                    box.put(widget.mymovie.key, temp);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added Movie'),
                    ),
                  );
                  Navigator.pop(context);
                }
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
