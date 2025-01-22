import 'package:flutter/material.dart';
import 'package:language_page/Customer_Login_Screens/BuyNow.dart';
import 'package:language_page/Customer_Login_Screens/Product_individual.dart';
import 'package:language_page/Customer_Login_Screens/ProfilePage.dart';
import 'package:language_page/Customer_Login_Screens/apple.dart';
import 'package:language_page/Customer_Login_Screens/home_product_model.dart';
import 'package:language_page/Customer_Login_Screens/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

List<HomeProduct> orderProductCards = [];
int startingID = 101;

bool flagComplete = true;

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({super.key});

  @override
  State<YourOrderPage> createState() => _YourOrderPage();
}

class _YourOrderPage extends State<YourOrderPage> {
  // Open Review BottomSheet
  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ReviewPage();
                  }));
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(45),
                ),
                child: const Text('Add Review',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ReviewWithMediaPage();
                  }));
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(45),
                ),
                child: const Text('Add Review with Image',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  String? dateOrder;

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    dateOrder = "2nd September";
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
                              const Text(
                                "Your Orders",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 26, 77, 28),
                                  fontSize: 25,
                                ),
                              ),
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
        orderProductCards.isEmpty
            ? const SliverFillRemaining(
                child: Center(
                  child: Text(
                    "Your order list is empty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    flagComplete == true
                                        ? dateOrder!
                                        : dateTodayOrder,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   "Order ID ${orderID}",
                              //   style: const TextStyle(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Text(
                                "Sold by: ${orderProductCards[index].farmerName}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Image on the left side
                                  orderProductCards[index].isBasketItem
                                      ? Image.asset(
                                          orderProductCards[index].image!,
                                          height: 90,
                                          width: 120,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.network(
                                          orderProductCards[index].image!,
                                          height: 90,
                                          width: 120,
                                          fit: BoxFit.contain,
                                        ),
                                  // Product info on the right side
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            orderProductCards[index].proName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                "₹${finalTotalPrice}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          flagComplete == true
                                              ? const Text(
                                                  "Delivered on 13 October")
                                              : const Text(
                                                  "Your order is on the way"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Rate Product: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StarRating(),
                                  // Add a TextButton or ElevatedButton next to the stars (if necessary)
                                  GestureDetector(
                                    onTap: () {
                                      _showReviewBottomSheet();
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text(
                                        "Add Review",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Text(
                                "Rate Delivery: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StarRating(),
                                  // Add a TextButton or ElevatedButton next to the stars (if necessary)
                                  GestureDetector(
                                    onTap: () {
                                      _showReviewBottomSheet();
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text(
                                        "Add Review",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: orderProductCards.length,
                ),
              ),
      ]),
    );
  }
}

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Display stars with reduced spacing
      ...List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 20, // Keep the icon size the same
          ),
        );
      })
        ..add(
          Text('$_rating Star${_rating != 1 ? 's' : ''}'),
        ),
    ]);
  }
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final String productName = "Fresh Organic Tomatoes";
  final double productPrice = 120.0;
  List<Map<String, dynamic>> reviews = []; // List to store reviews

  TextEditingController reviewController = TextEditingController();
  int? editingIndex;

  void addReview() {
    if (reviewController.text.isNotEmpty) {
      setState(() {
        reviews.add({
          'review': reviewController.text,
        });
        reviewController.clear(); // Clear the text field after submission
      });
    }
  }

  // Function to delete review
  void deleteReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  // Function to apply changes after editing a review
  void applyEdit() {
    if (editingIndex != null && reviewController.text.isNotEmpty) {
      setState(() {
        reviews[editingIndex!] = {
          'review': reviewController.text,
        };
        reviewController.clear();
        editingIndex = null; // Reset the editing index after applying
      });
    }
  }

  // Function to start editing a review
  void editReview(int index) {
    setState(() {
      editingIndex = index;
      reviewController.text = reviews[index]['review']!;
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
                  backgroundColor:
                      Colors.transparent, // Make AppBar transparent
                  elevation: 0,
                  title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Write a Review",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product info container
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(appleList[index].image!),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category: ${appleList[index].category}",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appleList[index].proName,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price: ₹${appleList[index].proPrice}/kg',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Review input field
              TextField(
                controller: reviewController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  hintText: 'Write your review here...',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green)),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),

              // Submit button or apply changes if editing
              GestureDetector(
                onTap: editingIndex == null ? addReview : applyEdit,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    editingIndex == null ? "Submit Review" : "Apply Changes",
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Display list of reviews
              if (reviews.isNotEmpty) ...[
                const Text(
                  'Recent Reviews:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      color: const Color.fromARGB(255, 241, 255, 242),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reviews[index]['review']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.green),
                              onPressed: () => editReview(index),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.green),
                              onPressed: () => deleteReview(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ] else ...[
                const Text(
                  'No reviews yet. Add your first review!',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Review with media page

class ReviewWithMediaPage extends StatefulWidget {
  @override
  _ReviewWithMediaPageState createState() => _ReviewWithMediaPageState();
}

class _ReviewWithMediaPageState extends State<ReviewWithMediaPage> {
  final String productName = "Fresh Organic Tomatoes";
  final double productPrice = 120.0;
  final TextEditingController _reviewController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _addReview() {
    if (_selectedImage != null && _reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'image': _selectedImage,
          'review': _reviewController.text,
        });
        _selectedImage = null;
        _reviewController.clear();
      });
    }
  }

  void _editReview(int index) {
    setState(() {
      _reviewController.text = _reviews[index]['review'];
      _selectedImage = _reviews[index]['image'];
      _reviews.removeAt(index);
    });
  }

  void _deleteReview(int index) {
    setState(() {
      _reviews.removeAt(index);
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
                  backgroundColor:
                      Colors.transparent, // Make AppBar transparent
                  elevation: 0,
                  title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          // SizedBox(width: 5,),
                          Text(
                            "Write a Review with Media",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    color: Colors.white),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(appleList[index].image!),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category: ${appleList[index].category}",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appleList[index].proName,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price: ₹${appleList[index].proPrice}/kg',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  width: double.infinity,
                  child: const Text(
                    "Resellers find images and videos more helpful than text alone",
                    style: TextStyle(fontSize: 15),
                  )),
              const SizedBox(height: 15),
              const Text(
                "Add Images/Videos",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                      : const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _reviewController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                    hintText: 'Write your review here...',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
                maxLines: 5,
              ),
              const SizedBox(height: 15),
              // ElevatedButton(
              //   onPressed: _addReview,
              //   child: const Text('Submit Review'),
              // ),
              // const SizedBox(height: 20),
              // Submit button or apply changes if editing
              GestureDetector(
                onTap: _addReview,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Submit Review",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              _reviews.isNotEmpty
                  ? Column(
                      children: _reviews.asMap().entries.map((entry) {
                        int index = entry.key;
                        var review = entry.value;
                        return Card(
                          color: const Color.fromARGB(255, 241, 255, 242),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Image.file(review['image'],
                                fit: BoxFit.cover, width: 50, height: 50),
                            title: Text(review['review']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.green),
                                  onPressed: () => _editReview(index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.green),
                                  onPressed: () => _deleteReview(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : const Text(
                      'No reviews yet. Add your first review!',
                      style: TextStyle(color: Colors.green),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
