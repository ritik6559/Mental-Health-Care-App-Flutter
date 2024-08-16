import 'package:mental_health_care_app/features/music/data/datasources/song_remote_data_sources.dart';
import 'package:mental_health_care_app/features/music/domain/entities/song.dart';
import 'package:mental_health_care_app/features/music/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSources songRemoteDataSources;

  SongRepositoryImpl({required this.songRemoteDataSources});

  @override
  Future<List<Song>> getAllSongs() async {
    return await songRemoteDataSources.getAllSongs();
  }
}
