import 'package:mental_health_care_app/features/music/domain/entities/song.dart';

class SongModel extends Song {
  SongModel({
    required super.id,
    required super.author,
    required super.title,
    required super.songLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'songLink': songLink,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id']?.toInt() ?? 0,
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      songLink: map['songLink'] ?? '',
    );
  }
}
