import 'package:mental_health_care_app/features/music/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getAllSongs();
}
