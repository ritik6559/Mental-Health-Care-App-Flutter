import 'package:mental_health_care_app/features/meditation/domain/entities/mood_message.dart';
import 'package:mental_health_care_app/features/meditation/domain/repository/meditation_repository.dart';

class GetMoodMessage {
  final MeditationRepository meditationRepository;

  GetMoodMessage({required this.meditationRepository});

  Future<MoodMessage> call(String mood) async {
    return meditationRepository.getMoodMessage(mood);
  }
}
