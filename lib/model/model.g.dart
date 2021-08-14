// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieItemAdapter extends TypeAdapter<MovieItem> {
  @override
  final int typeId = 0;

  @override
  MovieItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieItem(
      movieName: fields[0] as String,
      director: fields[1] as String,
      imagePath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.movieName)
      ..writeByte(1)
      ..write(obj.director)
      ..writeByte(3)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
