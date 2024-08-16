import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/features/music/domain/entities/song.dart';
import 'package:mental_health_care_app/features/music/domain/usecase/get_all_songs.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetAllSongs getAllSongs;
  SongBloc({required this.getAllSongs}) : super(SongInitial()) {
    on<SongEvent>((_, emit) {
      emit(SongLoading());
    });

    on<FetchSongs>(
      (event, emit) async {
        try {
          final songs =
              await getAllSongs.call(); // can also be written as getAllSongs();
          emit(
            SongLoaded(songs: songs),
          );
        } catch (e) {
          emit(
            SongError(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
