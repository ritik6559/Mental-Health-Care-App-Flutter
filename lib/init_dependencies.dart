import 'package:get_it/get_it.dart';
import 'package:mental_health_care_app/features/meditation/data/datasources/meditation_remote_data_sources.dart';
import 'package:mental_health_care_app/features/meditation/data/repository/meditation_repository_impl.dart';
import 'package:mental_health_care_app/features/meditation/domain/repository/meditation_repository.dart';
import 'package:mental_health_care_app/features/meditation/domain/usecases/get_daily_quote.dart';
import 'package:mental_health_care_app/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/get_daily_quote/get_daily_quote_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/modd_message_state.dart';
import 'package:mental_health_care_app/features/music/data/datasources/song_remote_data_sources.dart';
import 'package:mental_health_care_app/features/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_care_app/features/music/domain/repository/song_repository.dart';
import 'package:mental_health_care_app/features/music/domain/usecase/get_all_songs.dart';
import 'package:mental_health_care_app/features/music/presentation/bloc/song_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;



Future<void> init() async {
  // blocs
  sl.registerFactory(() => DailyQuoteBloc(getDailyQuote: sl()));
  sl.registerFactory(() => MoodMessageBloc(getMoodMessage: sl()));
  sl.registerFactory(() => SongBloc(getAllSongs: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDailyQuote(meditationRepository: sl()));
  sl.registerLazySingleton(() => GetMoodMessage(meditationRepository: sl()));
  sl.registerLazySingleton(() => GetAllSongs(sl()));

  // Repositories
  sl.registerLazySingleton<MeditationRepository>(
          () => MeditationRepositoryImpl(meditationRemoteDataSource:  sl()));
  sl.registerLazySingleton<SongRepository>(
          () => SongRepositoryImpl(songRemoteDataSources: sl()));

  // Data sources
  sl.registerLazySingleton<MeditationRemoteDataSource>(
          () => MeditationRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SongRemoteDataSources>(
          () => SongRemoteDataSourcesImpl(client: sl()));

  //
  sl.registerLazySingleton(() => http.Client());
}