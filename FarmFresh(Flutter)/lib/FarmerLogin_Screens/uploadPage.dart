import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/Customer_Login_Screens/home_customer.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/Customer_Login_Screens/mango.dart';
import 'package:language_page/Customer_Login_Screens/rice.dart';
import 'package:language_page/Customer_Login_Screens/tomato.dart';
import 'package:language_page/FarmerLogin_Screens/YourProducts.dart';
import 'dart:io';

import 'package:language_page/FarmerLogin_Screens/uploadPageModal.dart';
import 'package:language_page/Login_Signup_Screen/LoginPageFarmer.dart';
import 'package:language_page/Login_Signup_Screen/Login_page.dart';

// List myProductsList = [];
String finalurl = "";

String _parseQuantity(String? quantity) {
  if (quantity == null || quantity.isEmpty) {
    return "0"; // Default value for empty or null input
  }

  // Attempt to validate it's a valid numeric string
  final parsedValue = double.tryParse(quantity);
  if (parsedValue != null) {
    return quantity; // Return the original string if it's a valid number
  }

  log("Warning: Unable to parse quantity '$quantity' as a number.");
  return "Invalid"; // Return a fallback string for invalid input
}

// void getMyProductsCategory(String proName) async {
//   HomeProduct? productDataForCategory;
//   log("-----------------------------------------GET DATA========================================");
//   try {
//     DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
//         .instance
//         .collection("Category")
//         .doc(proName)
//         .collection("All").get();

//     if (response.exists && response.data() != null) {
//       Map<String, dynamic> data = response.data()!;

//       // Safe field access with type conversion
//       productDataForCategory = HomeProduct(
//         farmerName: data['Farmer Name'] ?? 'Good',
//         proName: data['Product Name'] ?? 'Good',
//         category: data['Product Variety'] ?? 'Good',
//         productDescrip: data['Product Description'] ?? 'Good',
//         quantityAvailable:
//             data.containsKey('Quantity Available((kg)(gram)(unit))')
//                 ? _parseQuantity(
//                     data['Quantity Available((kg)(gram)(unit))'].toString())
//                 : "0", // Default to "0" if the key is missing
//         proPrice: data.containsKey('Price per unit((kg)(gram)(unit))')
//             ? double.tryParse(
//                     data['Price per unit((kg)(gram)(unit))'].toString()) ??
//                 0.0
//             : 0.0,
//         harvestDate: data['Harvest Date'] ?? 'Good',
//         shelfLife: data['Expected Shelf Life'] ?? 'Good',
//       );

//       // Adding to appropriate list
//       if (productDataForCategory.proName.toLowerCase().contains("apple")) {
//         appleList.add(productDataForCategory);
//         log("Data added in Applelist");
//       } else if (productDataForCategory.proName
//           .toLowerCase()
//           .contains("mango")) {
//         MangoList.add(productDataForCategory);
//         log("Data added in Mango list");
//       }
//       log("Data added to list: $productDataForCategory");
//     } else {
//       log("No data found for category: $proName");
//     }
//   } catch (e) {
//     log("Error: $e");
//   }
//   log("-------------------End here 1--------------------------------------------------");
// }

Future<void> getMyProductsCategory(String proName) async {
  appleList.clear();

  MangoList.clear();

  tomatoList.clear();

  log("-----------------------------------------GET DATA 1========================================");
  try {
    // Query the "All" collection under the specified "Category" document
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection("Category")
        .doc(proName)
        .collection("All")
        .get();

    if (response.docs.isNotEmpty) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in response.docs) {
        Map<String, dynamic> data = doc.data();

        // Parse product data safely
        HomeProduct productDataForCategory = HomeProduct(
          image: data['Image'] ?? 'Good',
          farmerName: data['Farmer Name'] ?? 'Good',
          proName: data['Product Name'] ?? 'Good',
          category: data['Product Variety'] ?? 'Good',
          productDescrip: data['Product Description'] ?? 'Good',
          quantityAvailable:
              data.containsKey('Quantity Available((kg)(gram)(unit))')
                  ? _parseQuantity(
                      data['Quantity Available((kg)(gram)(unit))'].toString())
                  : "0", // Default to "0" if the key is missing
          proPrice: data.containsKey('Price per unit((kg)(gram)(unit))')
              ? double.tryParse(
                      data['Price per unit((kg)(gram)(unit))'].toString()) ??
                  0.0
              : 0.0,
          harvestDate: data['Harvest Date'] ?? 'Good',
          shelfLife: data['Expected Shelf Life'] ?? 'Good',
          productImages: data['MuiltImages'] ?? [],
        );

        // Add the product to the appropriate list
        if (proName == "Apple" ||
            proName == "apple" ||
            proName == "Apples" ||
            proName == "apples") {
          appleList.add(productDataForCategory);
          log("Data added in Apple list  : $appleList");
        } else if (proName == "Mango" ||
            proName == "mango" ||
            proName == "Mangoes" ||
            proName == "mangoes") {
          MangoList.add(productDataForCategory);
          log("Data added in Mango list");
          log("$MangoList");
        } else if (proName == "tomato" ||
            proName == "Tomato" ||
            proName == "Tomatoes" ||
            proName == "tomatoes") {
          tomatoList.add(productDataForCategory);
          log("Data added in tomato list");
        } else if (proName == "Rice" ||
            proName == "rice" ||
            proName == "Rices" ||
            proName == "rices") {
          riceList.add(productDataForCategory);
          log("Data added in Rice list");
        }
        log("Data added to list: $productDataForCategory");
      }
    } else {
      log("No data found for category: $proName");
    }
  } catch (e) {
    log("Error: $e");
  }
  log("-------------------End here 1--------------------------------------------------");
}

/// Helper function to parse quantity from a string

String? proName = "Apples";

Future<void> getMyProducts(String proName) async {
  products.clear();
  log("-----------------------------------------GET DATA 2========================================");
  try {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("User")
        .doc(farmerMail)
        .collection("All")
        .get();

    log("Mail:$farmerMail");
    log("got data: ${response.docs.length}");

    for (var doc in response.docs) {
      Map<String, dynamic> productData = doc.data() as Map<String, dynamic>;

      products.add({
        'Image': productData['Image'] ?? 'Good',
        'Farmer Name': productData['Farmer Name'] ?? 'Good',
        'Product Name': productData['Product Name'] ?? 'Good',
        'Product Variety': productData['Product Variety'] ?? 'Good',
        'Product Description': productData['Product Description'] ?? 'Good',
        'Quantity Available((kg)(gram)(unit))':
            productData.containsKey('Quantity Available((kg)(gram)(unit))')
                ? double.tryParse(
                        productData['Quantity Available((kg)(gram)(unit))']
                            .toString()) ??
                    0.0
                : 0.0,
        'Price per unit((kg)(gram)(unit))': productData
                .containsKey('Price per unit((kg)(gram)(unit))')
            ? double.tryParse(productData['Price per unit((kg)(gram)(unit))']
                    .toString()) ??
                0.0
            : 0.0,
        'Harvest Date': productData['Harvest Date'] ?? 'Good',
        'Expected Shelf Life': productData['Expected Shelf Life'] ?? 'Good',
        'MultiImages': productData['MultiImages'] ?? 'Good'
      });

      log("In for Loop");
    }
  } catch (e) {
    log("Error: $e");
  }
  log("-------------------End here 2--------------------------------------------------");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? photo;
  List<XFile> additionalPhotos = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productQualityController =
      TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController harvestDateController = TextEditingController();
  final TextEditingController shelfLifeController = TextEditingController();
  final TextEditingController ProfileImageController = TextEditingController();

  // Future<void> pickImage() async {
  //   photo = await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
  }

  List<String> imageUrls = [];

  Future<void> pickMultipleImages() async {
    final List<XFile> pickedImages = await imagePicker.pickMultiImage();
    setState(() {
      additionalPhotos.addAll(pickedImages);
    });
  }

  Future<void> uploadImageforMultipleImages(
      {required String fileName, required String filePath}) async {
    print("Uploading: $fileName");
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putFile(File(filePath));
    String downloadURL =
        await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
    imageUrls.add(downloadURL);
  }

  Future<void> uploadMultipleImages(List<XFile> images) async {
    for (var image in images) {
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString(); // Unique file name
      await uploadImageforMultipleImages(
          fileName: fileName, filePath: image.path);

      print("All images uploaded successfully!");
    }
  }

  Future<void> uploadImage({required String fileName}) async {
    print("Add Image to Firebase");
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putFile(File(photo!.path));
  }

  Future<String> downloadImageURL({required String fileName}) async {
    print("Get URL to Firebase");
    String url =
        await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
    finalurl = url;
    return url;
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm({required String url, required List imageUrls}) {
    if (_formKey.currentState!.validate()) {
      print('Farmer Name: ${farmerNameController.text}');
      print('Product Name: ${productNameController.text}');
      print('Product Quality: ${productQualityController.text}');
      print('Product Description: ${productDescriptionController.text}');
      print('Quantity: ${quantityController.text}');
      print('Price per Unit: ${priceController.text}');
      print('Harvest Date: ${harvestDateController.text}');
      print('Expected Shelf Life: ${shelfLifeController.text}');

      Map<String, Object> data = {
        "Image": url,
        "Farmer Name": farmerNameController.text.trim(),
        "Product Name": productNameController.text.trim(),
        "Product Variety": productQualityController.text.trim(),
        "Product Description": productDescriptionController.text.trim(),
        "Quantity Available((kg)(gram)(unit))": quantityController.text.trim(),
        "Price per unit((kg)(gram)(unit))": priceController.text.trim(),
        "Harvest Date": harvestDateController.text.trim(),
        "Expected Shelf Life": shelfLifeController.text.trim(),
        "MuiltImages": imageUrls
      };
      proName = productNameController.text.trim();
      FirebaseFirestore.instance
          .collection("User")
          .doc(farmerMail)
          .collection("All")
          .add(data);

      FirebaseFirestore.instance
          .collection("Category")
          .doc(proName)
          .collection("All")
          .add(data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product uploaded Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
      farmerNameController.clear();
      productNameController.clear();
      productDescriptionController.clear();
      priceController.clear();
      productQualityController.clear();
      quantityController.clear();
      harvestDateController.clear();
      shelfLifeController.clear();
      productQualityController.clear();
      photo = null;
      additionalPhotos.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Upload Your Product',
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Color.fromARGB(255, 26, 77, 28),
                      Colors.lightGreenAccent,
                      Colors.yellow,
                      Colors.white,
                    ],
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // photo = await imagePicker.pickImage(
                          //     source: ImageSource.gallery);
                          // if (photo != null) {
                          //   print("File =${photo!.path}");
                          //   setState(() {});
                          // }
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.blueGrey[50],
                            radius: 50,
                            backgroundImage: photo != null
                                ? FileImage(File(photo!.path))
                                : null,
                            child: photo == null
                                ? const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 65,
                                  )
                                : null),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: GestureDetector(
                          onTap: () async {
                            photo = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (photo != null) {
                              print("File =${photo!.path}");
                              setState(() {});
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            // child: photo == null
                            //     ? const Icon(
                            //         Icons.camera_alt,
                            //         color: Colors.blue,
                            //         size: 20,
                            //       )
                            //     : Image.file(
                            //         File(photo!.path),
                            //         fit: BoxFit.cover,
                            //       ),
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
                ),
                const SizedBox(height: 20),
                _buildCardInputField("Farmer Name", farmerNameController),
                const SizedBox(height: 10),
                _buildCardInputField("Product Name", productNameController),
                const SizedBox(height: 10),
                _buildCardInputField(
                    "Product Variety", productQualityController),
                const SizedBox(height: 10),
                _buildCardInputField(
                    "Product Description", productDescriptionController),
                const SizedBox(height: 10),
                _buildCardInputField(
                  "Quantity Available(/kg/gram/unit)",
                  quantityController,
                ),
                const SizedBox(height: 10),
                _buildCardInputField(
                  "Price per unit (kg/gram/units)",
                  priceController,
                ),
                const SizedBox(height: 10),
                _buildCardDateField("Harvest Date", harvestDateController),
                const SizedBox(height: 10),
                _buildCardDateField("Expected Shelf Life", shelfLifeController),
                const SizedBox(height: 20),

                // Multi-image picker
                const Text(
                  "Additional Images",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: pickMultipleImages,
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Pick Multiple Images"),
                ),
                const SizedBox(height: 10),

                // Display additional images
                additionalPhotos.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: additionalPhotos.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            File(additionalPhotos[index].path),
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : const Text("No additional images selected."),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      String fileName = photo!.name + DateTime.now().toString();

                      await uploadImage(fileName: fileName);

                      String url = await downloadImageURL(fileName: fileName);

                      // await uploadImageforMultipleImages(
                      //     fileName: fileName1, filePath: filePath);

                      await uploadMultipleImages(additionalPhotos);

                      // List<String> urls =
                      //     await downloadMultipleImageUrls(additionalPhotos);

                      _submitForm(url: url, imageUrls: imageUrls);

                      getMyProducts(proName!);
                      getMyProductsCategory(proName!);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardInputField(String label, TextEditingController controller,
      {bool isNumeric = false}) {
    return Card(
      elevation: 3,
      // shadowColor: Colors.grey.withOpacity(0.3),
      color: const Color.fromARGB(255, 226, 249, 227),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              cursorColor: Colors.green,
              decoration: const InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDateField(String label, TextEditingController controller) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.3),
      color: const Color.fromARGB(255, 226, 249, 227),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () => _selectDate(context, controller),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: controller,
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.green),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select $label';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<Uploadpagemodal> uploadProduct = [];
  static List<Uploadpagemodal> get getUploadProduct => uploadProduct;

  // Method to fetch additional images by index
  // static List<String> fetchAdditionalImages(int index) {
  //   if (index >= 0 && index < uploadProduct.length) {
  //     return uploadProduct[index]
  //         .getAdditionalImages; // Using the getter for additional images
  //   }
  //   return [];
  // }

  void FillData() {
    if (_formKey.currentState!.validate()) {
      // Print or handle the data
      print(uploadProduct);

      // Clear the form fields after successful submission
      farmerNameController.clear();
      productNameController.clear();
      productDescriptionController.clear();
      priceController.clear();
      productQualityController.clear();
      quantityController.clear();
      harvestDateController.clear();
      shelfLifeController.clear();
      photo = null;
      additionalPhotos.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product uploaded successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        ),
      );
    }
  }

  List<Uploadpagemodal> Fetchdata() {
    return uploadProduct;
  }

  _UploadPageState createyourProduct() => _UploadPageState();

  @override
  void dispose() {
    farmerNameController.dispose();
    productNameController.dispose();
    productQualityController.dispose();
    productDescriptionController.dispose();
    quantityController.dispose();
    priceController.dispose();
    harvestDateController.dispose();
    shelfLifeController.dispose();

    super.dispose();
  }
}

//  Future<List<String>> downloadMultipleImageUrls(List<XFile> images) async {

  //   for (var image in images) {
  //     String fileName = DateTime.now()
  //         .millisecondsSinceEpoch
  //         .toString(); // Same file name logic
  //     Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

  //     // Upload the image
  //     await storageRef.putFile(File(image.path));

  //     // Get the download URL
  //     String downloadURL = await storageRef.getDownloadURL();
  //     imageUrls.add(downloadURL);

  //     print('Download URL: $downloadURL');
  //   }

  //   return imageUrls;
  // }