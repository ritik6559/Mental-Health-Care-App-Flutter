import 'package:mental_health_care_app/features/music/domain/entities/song.dart';
import 'package:mental_health_care_app/features/music/domain/repository/song_repository.dart';

class GetAllSongs {
  final SongRepository songRepository;

  GetAllSongs(this.songRepository);

  Future<List<Song>> call() async {
    return await songRepository.getAllSongs();
  }
}
