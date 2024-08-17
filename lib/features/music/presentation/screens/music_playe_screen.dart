import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/music/domain/entities/song.dart';

class MusicPlayeScreen extends StatefulWidget {
  final Song song;
  const MusicPlayeScreen({super.key, required this.song});

  @override
  State<MusicPlayeScreen> createState() => _MusicPlayeScreenState();
}

class _MusicPlayeScreenState extends State<MusicPlayeScreen> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.song.songLink);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seekBackWard() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  void seekForWard() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _audioPlayer.seek(newPosition);
  }

  void seekRestart(){
    _audioPlayer.seek(Duration.zero);
  }

  void toggleLoop() {
    setState(() {
      isLooping = true;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

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
              widget.song.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            //Text(author name)
            Text(
              'By : ${widget.song.author}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            //ProgressBar(author name)
            const Spacer(),

            //action theme(author name)
            //action buttons
            const Spacer(),
            StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final total = _audioPlayer.duration ?? Duration.zero;
                return ProgressBar(
                  progress: position,
                  total: total,
                  baseBarColor: DefaultColors.lightpink,
                  progressBarColor: DefaultColors.pink,
                  thumbColor: DefaultColors.pink,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                  },
                );
              },
            ),
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
                  onPressed: seekBackWard,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: DefaultColors.pink,
                  ),
                ),
                StreamBuilder(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState =
                        playerState?.processingState ?? ProcessingState.idle;
                    final playing = playerState?.playing ?? false;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        height: 50,
                        child: const CircularProgressIndicator(
                          color: DefaultColors.pink,
                        ),
                      );
                    } else if (!playing) {
                      return IconButton(
                        iconSize: 80,
                        onPressed: togglePlayPause,
                        icon: const Icon(
                          Icons.play_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        iconSize: 80,
                        onPressed: togglePlayPause,
                        icon: const Icon(
                          Icons.pause_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    } else {
                      return IconButton(
                        iconSize: 80,
                        onPressed: seekRestart,
                        icon: const Icon(
                          Icons.replay_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    }
                  },
                ),
                IconButton(
                  onPressed: seekForWard,
                  icon: const Icon(
                    Icons.skip_next,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: toggleLoop,
                  icon: Icon(
                    isLooping ? Icons.repeat_one : Icons.repeat,
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
