import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/mood_message_event.dart';

class MoodMessageBloc extends Bloc<MoodMessageEvent, MoodMessageState>{
  final GetMoodMessage getMoodMessage;

  MoodMessageBloc({required this.getMoodMessage}) : super(MoodMessageInitial()) {
    on<FetchMoodMessage>((event, emit) async {
      emit(MoodMessageLoading());
      try{
        final moodMessage = await getMoodMessage(event.mood);
        emit(MoodMessageLoaded(moodMessage: moodMessage));
      } catch(e) {
        emit(MoodMessageError(message: e.toString()));
      }
    });

    on<ResetMoodMessage>((event, emit){
      emit(MoodMessageInitial());
    });
  }
}

