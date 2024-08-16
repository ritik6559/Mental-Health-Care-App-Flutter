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
  Future<List<SongModel>> getAllSongs() {
    
  }
}
