import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/get_daily_quote/get_daily_quote_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/get_daily_quote/get_daily_quote_event.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/modd_message_state.dart';
import 'package:mental_health_care_app/features/music/data/datasources/song_remote_data_sources.dart';
import 'package:mental_health_care_app/features/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_care_app/features/music/domain/usecase/get_all_songs.dart';
import 'package:mental_health_care_app/features/music/presentation/bloc/song_bloc.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_health_care_app/presentation/home/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'init_dependencies.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
          create: (context) => di.sl<SongBloc>()..add(
              FetchSongs(),
            ), //fetching songs as soon as the playlist screen loads.
        ),
        BlocProvider(
            create: (context)=> di.sl<DailyQuoteBloc>()..add(FetchDailyQuote()),
          ),
          BlocProvider(
              create: (context)=> di.sl<MoodMessageBloc>()
          )
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
