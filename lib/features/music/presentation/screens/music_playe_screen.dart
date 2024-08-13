import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/core/theme.dart';

class MusicPlayeScreen extends StatelessWidget {
  const MusicPlayeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/down_arrow.png'),
        actions: [
          Image.asset('assets/transcript_icon.png'),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //artwork
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/child_with_dog.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            //Text(title)
            const SizedBox(
              height: 16,
            ),
            Text(
              'Rain On Glass',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            //Text(author name)
            Text(
              'By : Painting with Passion',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            //ProgressBar(author name)
            const Spacer(),
            ProgressBar(
              progress: const Duration(milliseconds: 1000),
              total: const Duration(milliseconds: 5000),
              baseBarColor: DefaultColors.lightpink,
              onSeek: (duration) {
                print('User selected a new time : $duration');
              },
            ),
            //action theme(author name)
            //action buttons
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shuffle,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  iconSize: 80,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.pause_circle_filled,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.repeat,
                    color: DefaultColors.pink,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
