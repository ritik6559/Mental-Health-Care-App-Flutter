import 'package:mental_health_care_app/features/meditation/domain/entities/daily_quote.dart';
import 'package:mental_health_care_app/features/meditation/domain/repository/meditation_repository.dart';

class GetDailyQuote {
  final MeditationRepository meditationRepository;

  GetDailyQuote({required this.meditationRepository});

  Future<DailyQuote> call() async {
    return await meditationRepository.getDailyQuotes();
  }
}
