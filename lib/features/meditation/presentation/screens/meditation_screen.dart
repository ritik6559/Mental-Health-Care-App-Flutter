import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/get_daily_quote/get_daily_quote_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/get_daily_quote/get_daily_quote_state.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/modd_message_state.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/bloc/mood_message/mood_message_event.dart';
import 'package:mental_health_care_app/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:mental_health_care_app/features/meditation/presentation/widgets/task_card.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/menu_burger.png'),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/profile.png',
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "How are you feeling today ?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                    label: 'Happy',
                    image: 'assets/happy.png',
                    color: DefaultColors.pink,
                    onTap: () {},
                  ),
                  FeelingButton(
                    label: 'Calm',
                    image: 'assets/calm.png',
                    color: DefaultColors.purple,
                    onTap: () {},
                  ),
                  FeelingButton(
                    label: 'Relax',
                    image: 'assets/relax.png',
                    color: DefaultColors.orange,
                    onTap: () {},
                  ),
                  FeelingButton(
                    label: 'Focus',
                    image: 'assets/focus.png',
                    color: DefaultColors.lightteal,
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Today\'s Task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<DailyQuoteBloc, DailyQuoteState>(
                builder: (context, state) {
                  if (state is DailyQuoteLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is DailyQuoteLoaded) {
                    return Column(
                      children: [
                        TaskCard(
                          title: 'Morning',
                          description: state.dailyQuote.morningQuote,
                          color: DefaultColors.task1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: 'Noon',
                          description: state.dailyQuote.noonQuote,
                          color: DefaultColors.task2,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: 'Evening',
                          description: state.dailyQuote.eveningQuote,
                          color: DefaultColors.task3,
                        )
                      ],
                    );
                  } else if (state is DailyQuoteError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No data found',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<MoodMessageBloc, MoodMessageState>(
                builder: (context, state) {
                  if (state is MoodMessageLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    'My advice for you',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  content: Text(
                                    state.moodMessage.text,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context
                                            .read<MoodMessageBloc>()
                                            .add(ResetMoodMessage());
                                      },
                                      child: const Text(
                                        'ok',
                                      ),
                                    )
                                  ],
                                ));
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
