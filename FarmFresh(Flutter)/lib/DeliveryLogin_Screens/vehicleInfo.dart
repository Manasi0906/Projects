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
      home: VehicleInfoScreen(),
    );
  }
}

class VehicleInfoScreen extends StatefulWidget {
  const VehicleInfoScreen({super.key});

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  // Demo data
  String vehicleType = "Bike";
  String plateNumber = "MH11 4550";
  String licenseNumber = "DL123456789";
  String vehicleModel = "Honda Activa";

  // Text controllers for editing
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();

  void clearController(){
    _vehicleTypeController.clear();
    _plateNumberController.clear();
    _licenseNumberController.clear();
    _vehicleModelController.clear();

  }

  // Function to open the bottom sheet for editing
  void _editVehicleInfo() {
    // Set current values in the controllers
    _vehicleTypeController.text = vehicleType;
    _plateNumberController.text = plateNumber;
    _licenseNumberController.text = licenseNumber;
    _vehicleModelController.text = vehicleModel;

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
                "Edit Vehicle Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(_vehicleTypeController, "Vehicle Type"),
              const SizedBox(height: 15),
              _buildTextField(_plateNumberController, "License Plate Number"),
              const SizedBox(height: 15),
              _buildTextField(_licenseNumberController, "Driving License Number"),
              const SizedBox(height: 15),
              _buildTextField(_vehicleModelController, "Vehicle Model"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if any field is empty
                  if (_vehicleTypeController.text.isEmpty ||
                      _plateNumberController.text.isEmpty ||
                      _licenseNumberController.text.isEmpty ||
                      _vehicleModelController.text.isEmpty) {
                    // Show error message if any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields must be filled."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Replace old data with edited data
                    setState(() {
                      vehicleType = _vehicleTypeController.text;
                      plateNumber = _plateNumberController.text;
                      licenseNumber = _licenseNumberController.text;
                      vehicleModel = _vehicleModelController.text;
                    });

                    clearController();
                    Navigator.pop(context); 
                    

                    // Close bottom sheet
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
        title: Text(
          "Vehicle Information",
          style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 26, 77, 28),
                    ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color.fromARGB(255, 8, 95, 11)),
            onPressed: _editVehicleInfo,
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
                    Icons.directions_car,
                    size: 60,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoRow("Vehicle Type", vehicleType),
                _buildInfoRow("License Plate Number", plateNumber),
                _buildInfoRow("Driving License Number", licenseNumber),
                _buildInfoRow("Vehicle Model", vehicleModel),
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
