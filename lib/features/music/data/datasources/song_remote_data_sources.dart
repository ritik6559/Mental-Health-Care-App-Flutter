import 'dart:convert';

import 'package:mental_health_care_app/features/music/data/models/song_model.dart';
import 'package:http/http.dart' as http;

abstract class SongRemoteDataSources {
  Future<List<SongModel>> getAllSongs();
}

class SongRemoteDataSourcesImpl implements SongRemoteDataSources {
  final http.Client client;

  SongRemoteDataSourcesImpl({
    required this.client,
  });

  @override
  Future<List<SongModel>> getAllSongs() async {
    final respone = await client.get(
      Uri.parse('http://localhost:6000/songs/all'),
    );

    if (respone.statusCode == 200) {
      List jsonResponse = json.decode(respone.body);

      return jsonResponse.map((e) => SongModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
