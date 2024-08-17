import 'package:mental_health_care_app/features/meditation/data/datasources/meditation_remote_data_sources.dart';
import 'package:mental_health_care_app/features/meditation/domain/entities/daily_quote.dart';
import 'package:mental_health_care_app/features/meditation/domain/entities/mood_message.dart';
import 'package:mental_health_care_app/features/meditation/domain/repository/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDataSource meditationRemoteDataSource;

  MeditationRepositoryImpl({required this.meditationRemoteDataSource});

  @override
  Future<DailyQuote> getDailyQuotes() async {
    return await meditationRemoteDataSource.getDailyQuote();
  }

  @override
  Future<MoodMessage> getMoodMessage(String mood) async {
    return await meditationRemoteDataSource.getMessageByModd(mood);
  }
  

}
