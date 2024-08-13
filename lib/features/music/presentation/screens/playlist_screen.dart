import 'package:flutter/material.dart';
import 'package:mental_health_care_app/core/theme.dart';
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
      body: Container(
        color: DefaultColors.white,
        child: ListView.builder(
          itemCount: songs.length,
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
                songs[index]['title'].toString(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              subtitle: Text(
                songs[index]['artist'].toString(),
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
      ),
    );
  }
}
