import 'package:flutter/material.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/meditation/presentation/widgets/feeling_button.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              "Welcome back",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              "How are you feeling today ?",
            ),
            const SizedBox(
              height: 32,
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
          ],
        ),
      ),
    );
  }
}
