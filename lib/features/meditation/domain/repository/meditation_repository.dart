import 'package:mental_health_care_app/features/meditation/domain/entities/daily_quote.dart';
import 'package:mental_health_care_app/features/meditation/domain/entities/mood_message.dart';

abstract class MeditationRepository {
  Future<DailyQuote> getDailyQuotes();
  Future<MoodMessage>  getMoodMessage(String mood);
}
