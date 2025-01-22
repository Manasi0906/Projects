import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:language_page/FarmerLogin_Screens/ProfilePage.dart';
import 'package:language_page/FarmerLogin_Screens/farmer_homepage.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';
import 'package:language_page/chatApplication/loading.dart';
import 'package:language_page/language_provider.dart';
import 'package:provider/provider.dart';

class YourProfilePage extends StatefulWidget {
  const YourProfilePage({super.key});

  @override
  State<YourProfilePage> createState() => _YourProfilePage();
}

class _YourProfilePage extends State<YourProfilePage> {
  String email = 'sangam@gmail.com';
  String phone = '+919322762831';
  bool isEditing = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> pickImage() async {
    photo = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  final ImagePicker imagePicker = ImagePicker();
  XFile? photo;

  @override
  void initState() {
    super.initState();
    _emailController.text = email;
    _phoneController.text = phone;
    _bankAccountController.text = bankAccount;
    _upiIdController.text = upiId;
  }

  void _toggleEdit() {
    setState(() {
      if (isEditing) {
        // Save updated info
        email = _emailController.text;
        phone = _phoneController.text;
        bankAccount = _bankAccountController.text;
        upiId = _upiIdController.text;
      }
      isEditing = !isEditing;
    });
  }

  String bankAccount = '**** 1234';
  String upiId = 'example@upi';

  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _upiIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: 80.0,
        floating: true,
        snap: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
              ),
            ),

            //titlePadding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  weight: 30,
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            FutureBuilder<String>(
                              future: context
                                  .read<LanguageProvider>()
                                  .translateText("Your Profile"),
                              builder: (context, snapshot) {
                                return Text(snapshot.data ?? "Your Profile",
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Color.fromARGB(255, 26, 77, 28),
                                      fontWeight: FontWeight.bold,
                                    ));
                              },
                            ),
                            // const Text(
                            //   "Your Profile",
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     color: Color.fromARGB(255, 26, 77, 28),
                            //     fontSize: 28,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            // Profile Section
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey[50],
                      radius: 50,
                      backgroundImage:
                          photo != null ? FileImage(File(photo!.path)) : null,
                      child: photo == null
                          ? const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 55,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: GestureDetector(
                      onTap: pickImage,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Contact Information Dropdown Section
            ExpansionTile(
              leading: const Icon(Icons.contact_phone, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Contact Info"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Contact Info",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.green),
                          const SizedBox(width: 10),
                          isEditing
                              ? Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                  ),
                                )
                              : Text(
                                  email,
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.green),
                          const SizedBox(width: 10),
                          isEditing
                              ? Expanded(
                                  child: TextField(
                                    controller: _phoneController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Phone',
                                    ),
                                  ),
                                )
                              : Text(
                                  phone,
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: _toggleEdit,
                  icon: Icon(isEditing ? Icons.save : Icons.edit,
                      color: Colors.green),
                  label: Text(
                    isEditing ? 'Save' : 'Edit Contact Info',
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),

            // Bank & UPI Details Section
            ExpansionTile(
              leading:
                  const Icon(Icons.account_balance_wallet, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Bank and UPI details"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Bank and UPI details",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_balance,
                              color: Colors.green),
                          const SizedBox(width: 10),
                          isEditing
                              ? Expanded(
                                  child: TextField(
                                    controller: _bankAccountController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Bank Account',
                                    ),
                                  ),
                                )
                              : Text(
                                  'Bank Account: $bankAccount',
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.payments, color: Colors.green),
                          const SizedBox(width: 10),
                          isEditing
                              ? Expanded(
                                  child: TextField(
                                    controller: _upiIdController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'UPI ID',
                                    ),
                                  ),
                                )
                              : FutureBuilder<String>(
                                  future: context
                                      .read<LanguageProvider>()
                                      .translateText('UPI ID: $upiId'),
                                  builder: (context, snapshot) {
                                    return Text(
                                        snapshot.data ?? 'UPI ID: $upiId',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ));
                                  },
                                ),
                          // : Text(
                          //     'UPI ID: $upiId',
                          //     style: const TextStyle(fontSize: 16),
                          //   ),
                        ],
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: _toggleEdit,
                  icon: Icon(isEditing ? Icons.save : Icons.edit,
                      color: Colors.green),
                  label: Text(
                    isEditing ? 'Save' : 'Edit Bank & UPI',
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),

            // Additional Options
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Address Info"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Address Info",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Change Language"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Change Language",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguagePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Help Center"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Help Center",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HelpCenterPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.green),
              title: FutureBuilder<String>(
                future: context.read<LanguageProvider>().translateText("FAQs"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "FAQs",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.green),
              title: FutureBuilder<String>(
                future:
                    context.read<LanguageProvider>().translateText("About Us"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "About Us",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_border, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Rate and Review"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Rate and Review",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RateFarmFreshPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article_outlined, color: Colors.green),
              title: FutureBuilder<String>(
                future: context
                    .read<LanguageProvider>()
                    .translateText("Terms and Conditions"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Terms and Conditions",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsandconditionsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.green),
              title: FutureBuilder<String>(
                future:
                    context.read<LanguageProvider>().translateText("Setting"),
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "Setting",
                      style: const TextStyle(
                        fontSize: 18,
                      ));
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add your logout functionality here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Log Out"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform logout action
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          child: const Text("Log Out"),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  const MyProfilePage().switchBottomSheet(context);
                },
                child: Container(
                  height: 45,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: const Text(
                    "Switch Account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]));
  }
}

// Help Center Page
class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});
  State<HelpCenterPage> createState() => _HelpCenterPage();
}

class _HelpCenterPage extends State<HelpCenterPage> {
  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.green[50],
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 77, 28),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 350,
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Email: support@farmfreshapp.com',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    width: 350,
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Phone: +1-800-555-0199',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    width: 350,
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Address: 123 Narhe, Tal.Haveli, Dist. Pune, Maharashtra, India',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Help Center",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.local_shipping, color: Colors.green),
            title: const Text('Order Status & Delivery'),
            onTap: () {
              _showReviewBottomSheet();
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment, color: Colors.green),
            title: const Text('Refund & Payment'),
            onTap: () {
              _showReviewBottomSheet();
            },
          ),
          ListTile(
            leading: const Icon(Icons.swap_horiz, color: Colors.green),
            title: const Text('Return & Exchange'),
            onTap: () {
              _showReviewBottomSheet();
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.green),
            title: const Text('Account & Profile'),
            onTap: () {
              _showReviewBottomSheet();
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer, color: Colors.green),
            title: const Text('Offers & Discounts'),
            onTap: () {
              _showReviewBottomSheet();
            },
          ),
        ],
      ),
    );
  }
}

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final List<String> _addresses = [];
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedTaluka;

  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  String _errorMessage = '';

  final List<String> _countries = ['India'];
  final Map<String, List<String>> _states = {
    'India': [
      'Maharashtra',
      'Karnataka',
      'Gujarat',
      'Tamil Nadu',
      'Kerala',
      'Uttar Pradesh',
      'Rajasthan',
      'West Bengal',
      'Punjab',
      'Madhya Pradesh',
      // Add more states as needed
    ],
  };

  final Map<String, List<String>> _districts = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nashik', 'Nagpur', 'Aurangabad'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli', 'Mangalore', 'Belgaum'],
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot', 'Bhavnagar'],
    // Add districts for other states as needed
  };

  final Map<String, List<String>> _talukas = {
    'Pune': ['Shirur', 'Baramati', 'Daund', 'Haveli', 'Junnar'],
    'Mumbai': ['Dadar', 'Borivali', 'Andheri', 'Bandra', 'Goregaon'],
    'Nashik': ['Sinnar', 'Trimbak', 'Igatpuri', 'Niphad', 'Dindori'],
    'Bangalore': ['Anekal', 'Yelahanka', 'Bangalore North', 'Bangalore South'],
    'Ahmedabad': ['Daskroi', 'Sanand', 'Detroj-Rampura', 'Dholka', 'Bavla'],
    // Add talukas for other districts as needed
  };

  void _addAddress() {
    setState(() {
      _errorMessage = '';
      if (_selectedCountry == null ||
          _selectedState == null ||
          _selectedDistrict == null ||
          _selectedTaluka == null ||
          _pinCodeController.text.isEmpty ||
          _addressController.text.isEmpty) {
        _errorMessage = 'Please fill all the fields';
      } else {
        String newAddress =
            'Country: $_selectedCountry, State: $_selectedState, District: $_selectedDistrict, Taluka: $_selectedTaluka, Pin Code: ${_pinCodeController.text}, Address: ${_addressController.text}, Landmark: ${_landmarkController.text}';

        Navigator.pop(context, newAddress);

        _addresses.add(newAddress);
        _selectedCountry = null;
        _selectedState = null;
        _selectedDistrict = null;
        _selectedTaluka = null;
        _pinCodeController.clear();
        _addressController.clear();
        _landmarkController.clear();
      }
    });
  }

  Widget _buildDropdown<T>(String label, T? selectedValue, List<T> items,
      ValueChanged<T?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          labelStyle: const TextStyle(color: Colors.green),
        ),
        child: DropdownButton<T>(
          isExpanded: true,
          value: selectedValue,
          onChanged: onChanged,
          underline: Container(),
          items: items
              .map((item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      item.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          labelStyle: const TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor:
                      Colors.transparent, // Make AppBar transparent
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdown<String>(
              'Country',
              _selectedCountry,
              _countries,
              (value) => setState(() {
                _selectedCountry = value;
                _selectedState = null;
                _selectedDistrict = null;
                _selectedTaluka = null;
              }),
            ),
            if (_selectedCountry != null)
              _buildDropdown<String>(
                'State',
                _selectedState,
                _states[_selectedCountry!] ?? [],
                (value) => setState(() {
                  _selectedState = value;
                  _selectedDistrict = null;
                  _selectedTaluka = null;
                }),
              ),
            if (_selectedState != null)
              _buildDropdown<String>(
                'District',
                _selectedDistrict,
                _districts[_selectedState!] ?? [],
                (value) => setState(() {
                  _selectedDistrict = value;
                  _selectedTaluka = null;
                }),
              ),
            if (_selectedDistrict != null)
              _buildDropdown<String>(
                'Taluka',
                _selectedTaluka,
                _talukas[_selectedDistrict!] ?? [],
                (value) => setState(() => _selectedTaluka = value),
              ),
            _buildTextField('Pin Code', _pinCodeController,
                keyboardType: TextInputType.number),
            _buildTextField('Address', _addressController, maxLines: 2),
            _buildTextField('Landmark (optional)', _landmarkController),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAddress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Add Address',
                  style: TextStyle(color: Colors.white)),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),

            // Display the list of addresses
            if (_addresses.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _addresses.map((address) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(address,
                          style: const TextStyle(color: Colors.black)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() => _addresses.remove(address));
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<String> languages = [
    'English',
    'Hindi',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Urdu',
    'Gujarati',
    'Malayalam',
    'Kannada',
    'Oriya',
    'Punjabi',
    'Assamese',
    'Maithili',
    'Santali',
  ];

  // Default language
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor:
                      Colors.transparent, // Make AppBar transparent
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Language Selection",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 'Your Language' text with selected language
            Text(
              'Your Language: $selectedLanguage',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // 'Choose from' text
            const Text(
              'Choose from:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // List of languages in a Column with padding and green selection
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = languages[index];
                        });
                      },
                      //               onTap: ()async {
                      //                 // setState(() {
                      //                 //   selectedLanguage = languages[index];
                      //                 // });
                      //                 if (languages == 'More') {
                      //   final result = await Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => LanguagePage(),
                      //     ),
                      //   );
                      //   // if (result != null && result is String) {
                      //   //   _addLanguage(result);
                      //   // }
                      //       if (languages == 'English') {
                      //   // Add specific logic for English

                      //   setState(() {
                      //                   selectedLanguage = languages[index];
                      //                 });
                      //        context.read<LanguageProvider>().changeLanguage('en');
                      //   print('English selected');
                      // } else if (languages == 'Marathi') {
                      //   // Add specific logic for Marathi

                      //   setState(() {
                      //                   selectedLanguage = languages[index];
                      //                 });
                      //     context.read<LanguageProvider>().changeLanguage('mr');
                      //   print('Marathi selected');
                      // }else if (languages == 'Hindi') {
                      //   // Add specific logic for Marathi

                      //   setState(() {
                      //                   selectedLanguage = languages[index];
                      //                 });
                      //     context.read<LanguageProvider>().changeLanguage('hi');
                      //   print('hindi selected');
                      // }
                      // else if (languages == 'Tamil') {
                      //   // Add specific logic for Marathi
                      //  setState(() {
                      //                   selectedLanguage = languages[index];
                      //                 });
                      //     context.read<LanguageProvider>().changeLanguage('ta');
                      //   print('Tamil selected');
                      // }
                      //  else {
                      //  setState(() {
                      //                   selectedLanguage = languages[index];
                      //                 });
                      // }
                      //                 }
                      //               },

                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: selectedLanguage == languages[index]
                              ? Colors
                                  .green // Highlight the selected language in green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            // setState(() {
                            //   selectedLanguage = languages[index];
                            // });
                            //               if (languages == 'More') {
                            // final result = await Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => LanguagePage(),
                            //   ),
                            // );
                            // if (result != null && result is String) {
                            //   _addLanguage(result);
                            // }
                            if (languages[index] == 'English') {
                              // Add specific logic for English

                              setState(() {
                                selectedLanguage = languages[index];
                              });
                              context
                                  .read<LanguageProvider>()
                                  .changeLanguage('en');
                              print('English selected');
                            } else if (languages[index] == 'Marathi') {
                              // Add specific logic for Marathi

                              setState(() {
                                selectedLanguage = languages[index];
                              });
                              context
                                  .read<LanguageProvider>()
                                  .changeLanguage('mr');
                              print('Marathi selected');
                            } else if (languages[index] == 'Hindi') {
                              // Add specific logic for Marathi

                              setState(() {
                                selectedLanguage = languages[index];
                              });
                              context
                                  .read<LanguageProvider>()
                                  .changeLanguage('hi');
                              print('hindi selected');
                            } else if (languages[index] == 'Tamil') {
                              // Add specific logic for Marathi
                              setState(() {
                                selectedLanguage = languages[index];
                              });
                              context
                                  .read<LanguageProvider>()
                                  .changeLanguage('ta');
                              print('Tamil selected');
                            } else {
                              setState(() {
                                selectedLanguage = languages[index];
                              });
                            }
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 6));
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.of(context).pop();
                          },

                          // onTap: () {
                          //   Navigator.pop(context, languages[index]);
                          // },
                          child: Text(
                            languages[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: selectedLanguage == languages[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      "question": "What is this app about?",
      "answer":
          "This app is a digital marketplace connecting farmers directly with customers and distributors. It allows farmers to list their products, negotiate prices with buyers, and receive ratings and rankings on a leaderboard based on customer feedback."
    },
    {
      "question": "How do I create an account?",
      "answer":
          "Simply download the app and select your role (Farmer, Buyer, or Distributor) on the registration page. Fill in the required details, verify your account, and you're ready to start!"
    },
    {
      "question": "How does the negotiation feature work?",
      "answer":
          "The negotiation feature allows buyers to directly communicate with farmers to discuss pricing. When you are interested in a product, click on the Negotiate button to send your offer to the farmer, who can accept or counter the offer."
    },
    {
      "question": "How does the leaderboard work for farmers?",
      "answer":
          "Farmers are ranked based on factors such as customer ratings, responsiveness, and sales volume. This helps farmers track their performance and reputation, and customers can find reliable sellers based on these ratings."
    },
    {
      "question": "How do I find products I want to buy?",
      "answer":
          "You can browse through the product categories on the home page or use the search function to find specific products. Once you find a product you're interested in, you can view the details, negotiate if desired, or proceed to purchase."
    },
    {
      "question": "Can I communicate directly with the farmers?",
      "answer":
          "Yes, the app has a built-in messaging feature that allows buyers and distributors to communicate directly with farmers for negotiations or general inquiries about the product."
    },
    {
      "question": "Is there a delivery option for the products?",
      "answer":
          "Delivery options depend on the availability and preference of the farmer and distributor. During the purchase process, you can check delivery options and estimated times provided by the seller or coordinate for pickup if available."
    },
    {
      "question": "How is the payment process handled?",
      "answer":
          "Payments can be made through secure methods integrated within the app. Depending on your region, options may include credit/debit cards, online wallets, or cash on delivery where applicable."
    },
    {
      "question": "How do I leave feedback for a farmer?",
      "answer":
          "After a successful purchase, you’ll have an option to rate and review the farmer based on product quality, communication, and overall satisfaction. This rating will contribute to the farmer's leaderboard ranking."
    },
    {
      "question": "Can I track my orders?",
      "answer":
          "Yes, the app provides an order-tracking feature where you can monitor the status of your orders, including shipping updates if delivery is involved."
    },
    {
      "question": "How can I change my profile information?",
      "answer":
          "Go to your profile settings, where you can edit details like your name, contact information, address, and payment preferences."
    },
    {
      "question": "What should I do if I have a problem with an order?",
      "answer":
          "If you encounter any issues, you can contact the farmer directly through the app’s messaging feature. For additional support, you can also reach out to our customer support team under the Help section."
    },
    // Additional Customer-Related Questions
    {
      "question": "How do I cancel my order?",
      "answer":
          "You can cancel your order by going to the order details page and selecting the 'Cancel Order' option. Make sure to do this before the order has been shipped."
    },
    {
      "question": "Can I change my delivery address?",
      "answer":
          "Yes, you can update your delivery address in the 'Profile' section before the order is processed. After the order is shipped, address changes may not be possible."
    },
    {
      "question": "What if I receive damaged products?",
      "answer":
          "If you receive a damaged product, please contact the farmer immediately via the app’s messaging feature. You can also reach out to customer support for assistance with returns or refunds."
    },
    {
      "question": "Are there any discounts available?",
      "answer":
          "Occasionally, there are promotional discounts and offers. Keep an eye on the app's notifications for any ongoing sales or seasonal discounts."
    },
  ];

  FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "FAQs",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return FAQTile(
            question: faqData[index]["question"]!,
            answer: faqData[index]["answer"]!,
          );
        },
      ),
    );
  }
}

class FAQTile extends StatefulWidget {
  final String question;
  final String answer;

  const FAQTile({super.key, required this.question, required this.answer});

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          color: Colors.black,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.answer,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our app aims to bridge the gap between farmers and customers by providing a seamless digital marketplace. We empower farmers to showcase their products directly to customers, allowing for transparent pricing and better communication.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Our Vision',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We envision a future where technology simplifies the process of buying and selling fresh produce, benefiting both the farmers and the end consumers.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: support@farmfreshapp.com',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'Phone: +1-800-555-0199',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'Address: 123 Narhe, Tal.Haveli, Dist. Pune, Maharashtra, India',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class RateFarmFreshPage extends StatefulWidget {
  const RateFarmFreshPage({super.key});

  @override
  _RateFarmFreshPageState createState() => _RateFarmFreshPageState();
}

class _RateFarmFreshPageState extends State<RateFarmFreshPage> {
  double deliveryRating = 3.0;
  double customerSupportRating = 3.0;
  double productQualityRating = 3.0;
  double pricingRating = 3.0;

  double calculateOverallRating() {
    return (deliveryRating +
            customerSupportRating +
            productQualityRating +
            pricingRating) /
        4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Rate FarmFresh",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please rate the following services:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              buildStarRatingRow('Delivery Service', deliveryRating, (rating) {
                setState(() => deliveryRating = rating);
              }),
              buildStarRatingRow('Customer Support', customerSupportRating,
                  (rating) {
                setState(() => customerSupportRating = rating);
              }),
              buildStarRatingRow('Product Quality', productQualityRating,
                  (rating) {
                setState(() => productQualityRating = rating);
              }),
              buildStarRatingRow('Pricing', pricingRating, (rating) {
                setState(() => pricingRating = rating);
              }),
              const SizedBox(height: 20),
              const Text(
                'Overall Rating:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${calculateOverallRating().toStringAsFixed(1)} / 5',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Thank you for your feedback!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStarRatingRow(
      String label, double currentRating, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                Icons.star,
                color: index < currentRating ? Colors.amber : Colors.grey,
              ),
              onPressed: () => onChanged(index + 1.0),
            );
          }),
        ),
        Text(
          '${currentRating.toStringAsFixed(1)} / 5',
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class TermsandconditionsPage extends StatefulWidget {
  const TermsandconditionsPage({super.key});

  @override
  State<TermsandconditionsPage> createState() => _TermsandconditionsPageState();
}

class _TermsandconditionsPageState extends State<TermsandconditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  weight: 30,
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Terms And Conditions",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 26, 77, 28),
                              ),
                            ),
                          ])
                        ])))),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Terms and Conditions for Customers",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to FarmFresh! These terms and conditions outline the rules and regulations for using our app as a customer. By accessing or using the platform, you agree to comply with these terms.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1. Acceptance of Terms",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "By using FarmFresh, you agree to abide by these terms and conditions in full. If you do not agree, please do not use our services.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2. Account Registration",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "Customers must provide accurate and current information during the registration process. Any misleading information may result in account suspension or termination.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3. Product Purchases and Payments",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "All purchases made on FarmFresh must be paid for using the available payment methods. Payments are processed securely, and customers are responsible for any applicable fees.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4. Order Cancellations and Refunds",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "Customers may cancel their orders according to the cancellation policy outlined on the app. Refunds, if applicable, will be processed as per the company’s refund policy.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "5. User Conduct",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "Customers agree to use the platform in a lawful and respectful manner. Any abuse, harassment, or misconduct towards other users or staff will not be tolerated and may result in account termination.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "6. Privacy Policy",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "FarmFresh respects user privacy and handles personal data in accordance with our Privacy Policy. By using the app, you consent to the collection and use of your data as described in the policy.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "7. Limitation of Liability",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "FarmFresh is not liable for any indirect, incidental, or consequential damages resulting from the use of the app, including issues arising from product quality, delivery delays, or other service disruptions.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "8. Contact Information",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  "For any questions or concerns regarding these terms, please contact us at support@farmfresh.com or call our helpline at +1-800-123-4567.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkMode = false;
  bool locationTracking = true;
  bool personalizedAds = false;

  void _onNotificationsToggle(bool value) {
    setState(() {
      notificationsEnabled = value;
    });
  }

  void _onDarkModeToggle(bool value) {
    setState(() {
      darkMode = value;
    });
  }

  void _onLocationTrackingToggle(bool value) {
    setState(() {
      locationTracking = value;
    });
  }

  void _onPersonalizedAdsToggle(bool value) {
    setState(() {
      personalizedAds = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Color.fromARGB(255, 26, 77, 28),
                                weight: 30,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notifications setting
            SwitchListTile(
              title: Text(
                "Enable Notifications",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              value: notificationsEnabled,
              onChanged: _onNotificationsToggle,
            ),
            const Divider(),

            // Dark mode toggle
            SwitchListTile(
              title: Text(
                "Enable Dark Mode",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              value: darkMode,
              onChanged: _onDarkModeToggle,
            ),
            const Divider(),

            // Location tracking toggle
            SwitchListTile(
              title: Text(
                "Enable Location Tracking",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              value: locationTracking,
              onChanged: _onLocationTrackingToggle,
            ),
            const Divider(),

            // Personalized ads toggle
            SwitchListTile(
              title: Text(
                "Receive Personalized Ads",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              value: personalizedAds,
              onChanged: _onPersonalizedAdsToggle,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
