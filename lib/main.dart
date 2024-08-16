import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/music/data/datasources/song_remote_data_sources.dart';
import 'package:mental_health_care_app/features/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_care_app/features/music/domain/usecase/get_all_songs.dart';
import 'package:mental_health_care_app/features/music/presentation/bloc/song_bloc.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_health_care_app/presentation/home/screens/home_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SongBloc(
            getAllSongs: GetAllSongs(
              SongRepositoryImpl(
                songRemoteDataSources: SongRemoteDataSourcesImpl(
                  client: http.Client(),
                ),
              ),
            ),
          )..add(
              FetchSongs(),
            ),//fetching songs as soon as the playlist screen loads.
        ),
      ],
      child: MaterialApp(
        title: 'Mental Health App',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
