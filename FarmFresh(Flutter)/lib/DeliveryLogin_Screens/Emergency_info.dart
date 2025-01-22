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
      title: 'Safety & Emergency Info',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SafetyEmergencyPage(),
    );
  }
}

class SafetyEmergencyPage extends StatelessWidget {
  const SafetyEmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safety & Emergency Info',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Emergency Contacts'),
            _buildEmergencyContactsCard(context),
            const SizedBox(height: 16),
            _buildSectionTitle('Accident & Incident Reporting'),
            _buildIncidentReportingCard(context),
            const SizedBox(height: 16),
            _buildSectionTitle('First Aid Tips'),
            _buildFirstAidCard(context),
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

  Widget _buildEmergencyContactsCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.red.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.phone, color: Colors.red, size: 30),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Emergency Contact 1',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text('Police: 100',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text('Ambulance: 102',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.call, color: Colors.redAccent),
              onPressed: () {
                // Place a call or navigate to dialer
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncidentReportingCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.orange.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.report_problem, color: Colors.orange, size: 30),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Report an Incident',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    'In case of any accidents or issues, report here for quick assistance.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IncidentReportPage()),
                );
              },
              child: const Text('Report'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstAidCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.green.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.health_and_safety, color: Colors.green, size: 30),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Aid Tips',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    'Learn quick first aid responses for common injuries or incidents.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstAidTipsPage()),
                );
              },
              child: const Text('View Tips'),
            ),
          ],
        ),
      ),
    );
  }
}

class IncidentReportPage extends StatefulWidget {
  const IncidentReportPage({super.key});

  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  final _reportController = TextEditingController();

  void _submitReport() {
    String reportText = _reportController.text;
    if (reportText.isNotEmpty) {
      // Simulating the report submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Report Submitted: $reportText')),
      );
      _reportController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the incident details')),
      );
    }
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
        title: Text(
          "Incident Report",
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
            const Text(
              'Report an Incident',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reportController,
              decoration: InputDecoration(
                  labelText: 'Incident Details',
                  hintText: 'Describe the incident...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: _submitReport,
              child: const Text(
                'Submit Report',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstAidTipsPage extends StatelessWidget {
  const FirstAidTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Aid Tips'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: _generateFirstAidTips(),
      ),
    );
  }

  List<Widget> _generateFirstAidTips() {
    final tips = [
      {
        'title': 'Bleeding',
        'description':
            'Apply pressure to the wound with a clean cloth. Keep applying pressure until bleeding stops.'
      },
      {
        'title': 'Burns',
        'description':
            'Run cool water over the burn for 10-15 minutes. Avoid using ice or ointments.'
      },
      {
        'title': 'Choking',
        'description':
            'Perform the Heimlich maneuver by pushing upward on the abdomen until the object is dislodged.'
      },
      {
        'title': 'Fractures',
        'description':
            'Immobilize the injured area and seek medical assistance immediately.'
      },
      {
        'title': 'Heart Attack',
        'description':
            'Call emergency services immediately. Give CPR if necessary until help arrives.'
      },
      {
        'title': 'Stroke',
        'description':
            'Recognize the symptoms (Face drooping, Arm weakness, Speech difficulty) and call for help immediately.'
      },
      {
        'title': 'Severe Allergic Reaction',
        'description':
            'Use an epinephrine auto-injector if available, and call for emergency help.'
      },
      {
        'title': 'Hypothermia',
        'description':
            'Move the person to a warm area, remove wet clothes, and cover with blankets.'
      },
      {
        'title': 'Heat Stroke',
        'description':
            'Move to a cooler place, hydrate with water, and use cool compresses on the body.'
      },
      {
        'title': 'Asthma Attack',
        'description':
            'Assist the person in using their inhaler. If symptoms persist, seek medical help.'
      },
      {
        'title': 'Electric Shock',
        'description':
            'Turn off the power source before touching the person. Seek medical help immediately.'
      },
      {
        'title': 'Poisoning',
        'description':
            'Call Poison Control. Do not induce vomiting unless instructed by a professional.'
      },
      {
        'title': 'Severe Head Injury',
        'description':
            'Do not move the person unless necessary. Seek emergency medical help immediately.'
      },
      {
        'title': 'Insect Stings',
        'description':
            'Remove the stinger if visible, and apply ice to reduce swelling. Seek help if allergic reaction occurs.'
      },
      {
        'title': 'Foreign Object in Eye',
        'description':
            'Do not rub the eye. Flush with water or saline solution. Seek medical help if necessary.'
      },
    ];

    return tips.map((tip) {
      return _buildTipCard(tip['title']!, tip['description']!);
    }).toList();
  }

  Widget _buildTipCard(String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.local_hospital, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
