import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incentives & Bonuses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IncentivesBonusesPage(),
    );
  }
}

class IncentivesBonusesPage extends StatelessWidget {
  const IncentivesBonusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color.fromARGB(255, 232, 236, 233),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: Text(
          "Incentives & Bonuses",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Current Rewards'),
            _buildRewardsCard(context),
            const SizedBox(height: 16),
            _buildSectionTitle('Weekly/Monthly Bonuses'),
            _buildBonusesCard(context),
            const SizedBox(height: 16),
            _buildSectionTitle('Leaderboard'),
            _buildLeaderboardCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildRewardsCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.yellow.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.stars, color: Colors.orange, size: 30),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rewards Earned',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    'You have earned 5,000 points by completing milestone deliveries!',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                _redeemRewards(context);
              },
              child: const Text(
                'Redeem',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBonusesCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.attach_money, color: Colors.blue, size: 30),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Available Bonuses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    'Earn extra by completing more than 20 deliveries this week or 80 in a month.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                _showBonusDetails(context);
              },
              child: const Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.red.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.leaderboard,
                color: Color.fromARGB(255, 247, 134, 126), size: 30),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Performers',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    'You are ranked #3 in the leaderboard this month! Keep delivering to reach the top spot.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 240, 90, 79),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                _showLeaderboard(context);
              },
              child: const Text(
                'View All',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to redeem rewards
  void _redeemRewards(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redeem Rewards'),
        content: const Text('You have successfully redeemed your rewards!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Function to show bonus details
  void _showBonusDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bonus Details'),
        content: const Text(
            'You can earn a bonus by completing more than 20 deliveries this week or 80 in a month.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Function to show leaderboard with enhanced UI
  void _showLeaderboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EnhancedLeaderboardPage()),
    );
  }
}

class EnhancedLeaderboardPage extends StatefulWidget {
  const EnhancedLeaderboardPage({super.key});

  @override
  _EnhancedLeaderboardPageState createState() =>
      _EnhancedLeaderboardPageState();
}

class _EnhancedLeaderboardPageState extends State<EnhancedLeaderboardPage> {
  List<Map<String, String>> leaderboardData = [
    {
      'name': 'Alice',
      'rank': '1',
      'points': '10000',
      'deliveries': '150',
      'avatar': 'assets/delivery Profile/profile1.jpg'
    },
    {
      'name': 'Bob',
      'rank': '2',
      'points': '9500',
      'deliveries': '140',
      'avatar': 'assets/delivery Profile/profile2.jpg'
    },
    {
      'name': 'Charlie',
      'rank': '3',
      'points': '9000',
      'deliveries': '130',
      'avatar': 'assets/delivery Profile/profile3.jpg'
    },
    {
      'name': 'David',
      'rank': '4',
      'points': '8500',
      'deliveries': '120',
      'avatar': 'assets/delivery Profile/profile4.jpg'
    },
    {
      'name': 'Eve',
      'rank': '5',
      'points': '8000',
      'deliveries': '110',
      'avatar': 'assets/delivery Profile/profile5.jpg'
    },
    {
      'name': 'Frank',
      'rank': '6',
      'points': '7500',
      'deliveries': '100',
      'avatar': 'assets/delivery Profile/profile6.jpg'
    },
    {
      'name': 'Grace',
      'rank': '7',
      'points': '7000',
      'deliveries': '90',
      'avatar': 'assets/delivery Profile/profile7.jpg'
    },
    {
      'name': 'Hannah',
      'rank': '8',
      'points': '6500',
      'deliveries': '80',
      'avatar': 'assets/delivery Profile/profile8.jpg'
    },
    {
      'name': 'Isaac',
      'rank': '9',
      'points': '6000',
      'deliveries': '70',
      'avatar': 'assets/delivery Profile/profile1.jpg'
    },
    {
      'name': 'Jack',
      'rank': '10',
      'points': '5500',
      'deliveries': '60',
      'avatar': 'assets/delivery Profile/profile3.jpg'
    }
  ];

  List<Map<String, String>> filteredLeaderboardData = [];

  @override
  void initState() {
    super.initState();
    filteredLeaderboardData = leaderboardData;
  }

  void _filterLeaderboard(String query) {
    final filteredData = leaderboardData.where((player) {
      return player['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredLeaderboardData = filteredData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color.fromARGB(255, 232, 236, 233),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title: const Text(
          "LeaderBoard",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterLeaderboard,
              decoration: const InputDecoration(
                labelText: 'Search ',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLeaderboardData.length,
              itemBuilder: (context, index) {
                final player = filteredLeaderboardData[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(player['avatar']!),
                    ),
                    title: Text(player['name']!),
                    subtitle: Text(
                        'Rank: ${player['rank']}, Points: ${player['points']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        _showPlayerDetails(context, player);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Show Player Details
  void _showPlayerDetails(
      BuildContext context, Map<String, String> playerData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(playerData['name']!),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Rank: ${playerData['rank']}'),
            Text('Points: ${playerData['points']}'),
            Text('Deliveries: ${playerData['deliveries']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
