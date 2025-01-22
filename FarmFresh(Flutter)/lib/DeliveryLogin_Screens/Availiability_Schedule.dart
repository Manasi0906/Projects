import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Availability Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AvailabilitySchedulePage(),
    );
  }
}

class AvailabilitySchedulePage extends StatefulWidget {
  const AvailabilitySchedulePage({super.key});

  @override
  _AvailabilitySchedulePageState createState() =>
      _AvailabilitySchedulePageState();
}

class _AvailabilitySchedulePageState extends State<AvailabilitySchedulePage> {
  bool isDayOff = false;
  String selectedTime = "Select Time";
  TimeOfDay selectedStartTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay selectedEndTime = const TimeOfDay(hour: 17, minute: 0);
  DateTime selectedDate = DateTime.now();

  // A list to store the selected schedule
  List<Map<String, String>> scheduleList = [];

  // Function to show time picker dialog
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    if (isDayOff) {
      // Show a Snackbar when trying to set time while Day Off is on
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot set time on Day Off')),
      );
      return; // Prevent time picker if it's a day off
    }

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? selectedStartTime : selectedEndTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          selectedStartTime = pickedTime;
        } else {
          selectedEndTime = pickedTime;
        }
        selectedTime =
            "${selectedStartTime.format(context)} - ${selectedEndTime.format(context)}";
      });
    }
  }

  // Function to show date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    if (isDayOff) {
      // Show a Snackbar when trying to set date while Day Off is on
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot set date on Day Off')),
      );
      return; // Prevent date picker if it's a day off
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Function to add the availability schedule to the list
  void _addSchedule() {
    if (isDayOff) {
      // Show a Snackbar when trying to add schedule while Day Off is on
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot add schedule on Day Off')),
      );
      return; // Don't add schedule if it's a day off
    }

    setState(() {
      scheduleList.add({
        "date": DateFormat('yyyy-MM-dd').format(selectedDate),
        "start": selectedStartTime.format(context),
        "end": selectedEndTime.format(context),
        "status": 'Available',
      });
    });
  }

  // Function to toggle day off status
  void _toggleDayOff() {
    setState(() {
      isDayOff = !isDayOff;
      if (isDayOff) {
        // Reset values when switching to day off
        selectedStartTime = const TimeOfDay(hour: 9, minute: 0);
        selectedEndTime = const TimeOfDay(hour: 17, minute: 0);
        selectedDate = DateTime.now();
        selectedTime = "Select Time";
      }
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
        title: Text(
          "Available Schedule",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 26, 77, 28),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Off Toggle
            Row(
              children: [
                const Text('Mark as Day Off:'),
                Switch(
                  value: isDayOff,
                  onChanged: (value) {
                    _toggleDayOff();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Date Picker for date selection
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber.shade100,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.orange),
                    const SizedBox(width: 10),
                    Text(
                      "Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Time Picker for start and end time
            GestureDetector(
              onTap: () => _selectTime(context, true),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue.shade50,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.blue),
                    const SizedBox(width: 10),
                    Text(
                      "Start Time: ${selectedStartTime.format(context)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context, false),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green.shade50,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.green),
                    const SizedBox(width: 10),
                    Text(
                      "End Time: ${selectedEndTime.format(context)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Add Schedule Button
            ElevatedButton(
              onPressed: _addSchedule,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'Add Schedule',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            // Display the list of schedules
            if (scheduleList.isNotEmpty) ...[
              const Text(
                'Your Availability Schedule:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: scheduleList.length,
                  itemBuilder: (context, index) {
                    final schedule = scheduleList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      color: schedule['status'] == 'Available'
                          ? Colors.red.shade100
                          : Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        title: Text(
                          '${schedule['status']}: ${schedule['date']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Working Hours: ${schedule['start']} - ${schedule['end']}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              scheduleList.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
