import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/music/presentation/bloc/song_bloc.dart';
import 'package:mental_health_care_app/features/music/presentation/screens/music_playe_screen.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({
    super.key,
  });

  final List<Map<String, String>> songs = [
    {
      'title': 'Rain On Glass',
      'artist': 'Rain on Glass',
      'thumbnail': 'assets/child_with_dog.png',
    },
    {
      'title': 'Gentle Breeze',
      'artist': 'Soothing Sounds',
      'thumbnail': 'assets/child_with_dog.png',
    },
    {
      'title': 'Whispering Pines',
      'artist': 'Nature Sounds',
      'thumbnail': 'assets/child_with_dog.png',
    },
    {
      'title': 'Ocean Waves Breeze',
      'artist': 'Soothing Sounds',
      'thumbnail': 'assets/child_with_dog.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/down_arrow.png'),
        ),
        backgroundColor: DefaultColors.white,
        elevation: 1,
        centerTitle: false,
        title: Text(
          'Chill Playlist',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SongLoaded) {
            return Container(
              color: DefaultColors.white,
              child: ListView.builder(
                itemCount: state.songs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        songs[index]['thumbnail'].toString(),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    title: Text(
                      state.songs[index].title.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    subtitle: Text(
                      state.songs[index].author.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MusicPlayeScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else if (state is SongError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
          return Center(
            child: Text(
              'No songs',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
        },
      ),
    );
  }
}
