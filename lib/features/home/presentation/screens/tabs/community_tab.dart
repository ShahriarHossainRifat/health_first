import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D0D0D),
          elevation: 0,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Community',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'AI-powered groups . Peer-led session',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Groups'),
              Tab(text: 'My Groups'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            AllGroupsTab(),
            MyGroupsTab(),
          ],
        ),
      ),
    );
  }
}

class AllGroupsTab extends StatelessWidget {
  const AllGroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const V1V2ProgressionCard(),
          const SizedBox(height: 24),
          const GroupFilters(),
          const SizedBox(height: 16),
          GroupCard(
            imageUrl:
                'https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Calm Starter',
            tag: 'V2-Advance',
            time: '19 March at 8:30pm',
            coach: 'Kathryn Murphy . Coach',
            peers: '23 peers',
            status: 'Locked',
            statusColor: Colors.grey,
          ),
          const SizedBox(height: 16),
          GroupCard(
            imageUrl:
                'https://images.pexels.com/photos/1556699/pexels-photo-1556699.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Step by step recovery',
            tag: 'V1-Beginers',
            time: '',
            coach: 'Ronald Richards . Coach',
            peers: '23 peers',
            status: 'Sign-up',
            statusColor: Colors.blue,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          GroupCard(
            imageUrl:
                'https://images.pexels.com/photos/963278/pexels-photo-963278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Sleep Reset Cohort',
            tag: 'V1-Beginers',
            time: '19 March at 8:30pm',
            coach: 'Priya Singh . Coach',
            peers: '23 peers',
            status: 'Upcoming',
            statusColor: Colors.orange,
          ),
          const SizedBox(height: 16),
          GroupCard(
            imageUrl:
                'https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Step by step recovery',
            tag: 'V1-Beginers',
            time: '19 March at 8:30pm',
            coach: 'Priya Singh . Coach',
            peers: '23 peers',
            status: 'Upcoming',
            statusColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class V1V2ProgressionCard extends StatelessWidget {
  const V1V2ProgressionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF18181B),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.assignment, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'V1 -> V2 Progression',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '8 weeks consistent improvement unlock Advanced sessions',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupFilters extends StatelessWidget {
  const GroupFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ActionChip(
            label: const Text('All'),
            onPressed: () {},
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 8),
          ActionChip(
            label: const Text('Version 1'),
            onPressed: () {},
            backgroundColor: const Color(0xFF27272A),
            labelStyle: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 8),
          ActionChip(
            label: const Text('Version 2'),
            onPressed: () {},
            backgroundColor: const Color(0xFF27272A),
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String tag;
  final String time;
  final String coach;
  final String peers;
  final String status;
  final Color statusColor;
  final VoidCallback? onTap;

  const GroupCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.tag,
    required this.time,
    required this.coach,
    required this.peers,
    required this.status,
    required this.statusColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF18181B),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover, height: 150, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const SizedBox(height: 12),
                if (time.isNotEmpty)
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.grey, size: 14),
                      const SizedBox(width: 8),
                      Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12))
                    ],
                  ),
                if (time.isNotEmpty) const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person_outline, color: Colors.grey, size: 14),
                    const SizedBox(width: 8),
                    Text(coach, style: const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.people_outline, color: Colors.grey, size: 14),
                    const SizedBox(width: 8),
                    Text(peers, style: const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
              ],
            ),
          ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                    backgroundColor: statusColor,
                    minimumSize: const Size(double.infinity, 48)),
                child: Text(status),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }
}

class MyGroupsTab extends StatelessWidget {
  const MyGroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Live',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const LiveGroupCard(),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'AI Group Suggestion',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Based on your health data',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: Row(
              children: const [
                SizedBox(width: 16),
                Expanded(
                    child: SuggestionGroupCard(
                  imageUrl:
                      'https://images.pexels.com/photos/724994/pexels-photo-724994.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  title: 'Sleep Reset Cohort',
                  coach: 'Priya Singh . Coach',
                  peers: '15/25',
                  tag: 'V1-Beginers',
                  match: 0.96,
                )),
                SizedBox(width: 16),
                Expanded(
                    child: SuggestionGroupCard(
                  imageUrl:
                      'https://images.pexels.com/photos/1435752/pexels-photo-1435752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  title: 'Step by step recovery',
                  coach: 'Priya Singh . Coach',
                  peers: '23 similar peers',
                  tag: 'V1-Beginers',
                  match: 0.58,
                )),
                SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'My Groups',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Your enrolled group',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          const EnrolledGroupCard(
            imageUrl:
                'https://images.pexels.com/photos/355887/pexels-photo-355887.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Sleep Reset Cohort',
            coach: 'Priya Singh . Coach',
            peers: '23 similar peers',
            tag: 'V1-Beginers',
          ),
          const SizedBox(height: 16),
          const EnrolledGroupCard(
            imageUrl:
                'https://images.pexels.com/photos/326514/pexels-photo-326514.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            title: 'Step by step recovery',
            coach: 'Priya Singh . Coach',
            peers: '23 similar peers',
            tag: 'V1-Beginers',
          ),
        ],
      ),
    );
  }
}

class LiveGroupCard extends StatelessWidget {
  const LiveGroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF18181B),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Live now', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Calm Starters',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 4),
                  const Text('V2-Advance',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.person_outline, color: Colors.grey, size: 14),
                      SizedBox(width: 4),
                      Text('Priya Singh . Coach',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                   const SizedBox(height: 4),
                  Row(
                    children: const [
                       Icon(Icons.people_outline, color: Colors.grey, size: 14),
                       SizedBox(width: 4),
                       Text('15/25', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       SizedBox(width: 12),
                       Icon(Icons.mic, color: Colors.grey, size: 14),
                       SizedBox(width: 4),
                       Text('Audio', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.red,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
              child: const Text('Join', style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}

class SuggestionGroupCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String coach;
  final String peers;
  final String tag;
  final double match;

  const SuggestionGroupCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.coach,
    required this.peers,
    required this.tag,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF18181B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover, height: 100, width: double.infinity),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(tag, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.person_outline, color: Colors.grey, size: 14),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(coach,
                                style: const TextStyle(color: Colors.grey, fontSize: 10),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.people_outline, color: Colors.grey, size: 14),
                          const SizedBox(width: 4),
                          Text(peers, style: const TextStyle(color: Colors.grey, fontSize: 10))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value: match,
                        backgroundColor: Colors.grey[800],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      Text('${(match * 100).toInt()}% Matched',
                          style: const TextStyle(color: Colors.blue, fontSize: 12)),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(double.infinity, 36)),
                        child: const Text('Join Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnrolledGroupCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String coach;
  final String peers;
  final String tag;

  const EnrolledGroupCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.coach,
    required this.peers,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF18181B),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover, height: 140, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text(tag,
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person_outline, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(coach,
                        style: const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.people_outline, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(peers,
                        style: const TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
             child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: const StadiumBorder(),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Open'),
              ),
           ),
        ],
      ),
    );
  }
}
