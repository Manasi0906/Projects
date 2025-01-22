import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageFarmer.dart';

String farmerprofileURL = "";

class DeliveryPersonProfile extends StatefulWidget {
  const DeliveryPersonProfile({super.key});

  @override
  State<DeliveryPersonProfile> createState() => _DeliveryPersonProfileState();
}

class _DeliveryPersonProfileState extends State<DeliveryPersonProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  String _profileImageUrl = ""; // To store the profile image URL

  /// Function to upload image to Firebase Storage and retrieve the URL
  Future<void> uploadImage(XFile photo) async {
    try {
      String fileName = "${DateTime.now()}_${photo.name}";
      // Upload image to Firebase Storage
      await FirebaseStorage.instance.ref(fileName).putFile(File(photo.path));

      // Get download URL
      String downloadUrl =
          await FirebaseStorage.instance.ref(fileName).getDownloadURL();

      setState(() {
        _profileImageUrl = downloadUrl;
        farmerprofileURL = downloadUrl;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile image updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading image: $e")),
      );
    }
  }

  /// Function to handle image selection
  Future<void> selectAndUploadImage() async {
    try {
      XFile? photo = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        await uploadImage(photo);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error selecting image: $e")),
      );
    }
  }

  /// Bottom Sheet to edit profile details
  void profileBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              buildTextField("Name:", "Enter your Name"),
              const SizedBox(height: 20),
              buildTextField("Mobile No. :", "Enter your Mobile Number"),
              const SizedBox(height: 20),
              buildTextField("Email:", "Enter your Email"),
              const SizedBox(height: 20),
              buildTextField(
                  "Available Products:", "Enter your available Products"),
              const SizedBox(height: 20),
              buildTextField("Address:", "Enter your Address"),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Helper function to build text fields
  Widget buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            GestureDetector(
                              onTap:
                                  selectAndUploadImage, // Direct upload on selection
                              child: CircleAvatar(
                                backgroundColor: Colors.blueGrey[50],
                                radius: 50,
                                backgroundImage: _profileImageUrl.isNotEmpty
                                    ? NetworkImage(_profileImageUrl)
                                    : null,
                                child: _profileImageUrl.isEmpty
                                    ? const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 65,
                                      )
                                    : null,
                              ),
                            ),
                            Positioned(
                              right: 4,
                              bottom: 4,
                              child: GestureDetector(
                                onTap:
                                    selectAndUploadImage, // Direct upload on tap
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileTable(
                    data: {
                      "Username": signupFarmer[0].Username,
                      "Contact Number": signupFarmer[0].MobileNo,
                      "Email": signupFarmer[0].Email,
                      "Address": signupFarmer[0].Address,
                      "Full Name": signupFarmer[0].FullName,
                      "Years of Experience": "3 years",
                      "Average Rating": "4.0 / 5.0",
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Dedicated and reliable delivery professional with over 3 years of experience in providing excellent customer service and timely deliveries.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: profileBottomSheet,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ProfileTable widget to display profile details
class ProfileTable extends StatelessWidget {
  final Map<String, String> data;

  const ProfileTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.7),
        1: FlexColumnWidth(1),
      },
      children: data.entries
          .map(
            (entry) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
