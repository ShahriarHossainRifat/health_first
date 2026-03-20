import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class MentalTab extends StatelessWidget {
  final VoidCallback? onNotificationPressed;

  const MentalTab({super.key, this.onNotificationPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: CustomAppBar(onNotificationPressed: onNotificationPressed),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mood History', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const MoodHistoryCard(),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(child: NeuralFocusCard()),
                SizedBox(width: 16),
                Expanded(child: VocalJournalCard()),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Guides', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const GuidesSection(),
            const SizedBox(height: 24),
            const Text('Elite Tools', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const EliteToolsSection(),
            const SizedBox(height: 24),
            const Text('Live Mood Map', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const LiveMoodMapCard(),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Start Chat'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Need Support', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoodHistoryCard extends StatelessWidget {
  const MoodHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF18181B),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Row(
                  children: const [
                    Icon(Icons.circle, color: Colors.green, size: 8),
                    SizedBox(width: 4),
                    Text('Live', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                MoodBar(day: 'MON', value: 0.6),
                MoodBar(day: 'TUE', value: 0.4),
                MoodBar(day: 'WED', value: 0.2),
                MoodBar(day: 'THU', value: 0.3),
                MoodBar(day: 'FRI', value: 0.8),
                MoodBar(day: 'SAT', value: 0.5),
                MoodBar(day: 'SUN', value: 0.7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoodBar extends StatelessWidget {
  final String day;
  final double value;

  const MoodBar({super.key, required this.day, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100 * value,
          width: 12,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class NeuralFocusCard extends StatelessWidget {
  const NeuralFocusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF18181B),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.play_circle_fill, color: Colors.blue, size: 32),
              SizedBox(height: 8),
              Text('Neural Focus', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Binaural * 40Hz Gamma', style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 4),
              Text('Sound escape for relaxation', style: TextStyle(color: Colors.blue, fontSize: 12)),
            ],
          ),
        ));
  }
}

class VocalJournalCard extends StatelessWidget {
  const VocalJournalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF18181B),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.mic, color: Colors.red, size: 32),
              SizedBox(height: 8),
              Text('Vocal Journal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('"Feeling anxious about work deadline..."', style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 4),
              Text('Stress Detected: High', style: TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ),
        ));
  }
}

class GuidesSection extends StatelessWidget {
  const GuidesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          GuideCard(imageUrl: 'https://images.pexels.com/photos/1051838/pexels-photo-1051838.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', title: 'Meditation'),
          SizedBox(width: 16),
          GuideCard(imageUrl: 'https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', title: 'Breathing'),
        ],
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const GuideCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: const Color(0xFF18181B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(imageUrl, height: 120, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class EliteToolsSection extends StatelessWidget {
  const EliteToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        EliteToolCard(icon: Icons.grid_view, title: 'AR Grounding', subtitle: 'Reality Check'),
        SizedBox(height: 16),
        EliteToolCard(icon: Icons.favorite_border, title: 'Bio-Feedback', subtitle: 'HRV Breathing'),
        SizedBox(height: 16),
        EliteToolCard(icon: Icons.waves, title: 'Sleep Hypnosis', subtitle: 'Delta waves'),
      ],
    );
  }
}

class EliteToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const EliteToolCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF18181B),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 32),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.more_horiz, color: Colors.grey),
      ),
    );
  }
}

class LiveMoodMapCard extends StatelessWidget {
  const LiveMoodMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF18181B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('4,203', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Live', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                ),
                Row(
                  children: const [
                    Text('Mumbai, India', style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Image.network('https://images.pexels.com/photos/373543/pexels-photo-373543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', height: 150, fit: BoxFit.cover, width: double.infinity),
        ],
      ),
    );
  }
}
