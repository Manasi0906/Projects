import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmergencyContactScreen(),
    );
  }
}

class EmergencyContactScreen extends StatefulWidget {
  const EmergencyContactScreen({super.key});

  @override
  State<EmergencyContactScreen> createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  // Demo emergency contact data
  String contactName = "John Doe";
  String relation = "Brother";
  String contactNumber = "123-456-7890";

  // Text controllers for editing
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();

  // Function to open the bottom sheet for editing
  void _editEmergencyContact() {
    _contactNameController.text = contactName;
    _relationController.text = relation;
    _contactNumberController.text = contactNumber;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Edit Emergency Contact",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(_contactNameController, "Contact Name"),
              const SizedBox(height: 15),
              _buildTextField(_relationController, "Relation"),
              const SizedBox(height: 15),
              _buildTextField(_contactNumberController, "Contact Number"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_contactNameController.text.isEmpty ||
                      _relationController.text.isEmpty ||
                      _contactNumberController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields must be filled."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    setState(() {
                      contactName = _contactNameController.text;
                      relation = _relationController.text;
                      contactNumber = _contactNumberController.text;
                    });

                    _contactNameController.clear();
                    _relationController.clear();
                    _contactNumberController.clear();

                    Navigator.pop(context); // Close the bottom sheet
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
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
        title:  Text(
          "Emergency Contacts",
          style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 26, 77, 28),
                    ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color.fromARGB(255, 23, 116, 26)),
            onPressed: _editEmergencyContact,
          ),
        ],
      ),
        
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.contact_phone,
                    size: 60,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoRow("Contact Name", contactName),
                _buildInfoRow("Relation", relation),
                _buildInfoRow("Contact Number", contactNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
