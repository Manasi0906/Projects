// import 'package:flutter/material.dart';
// import 'package:language_page/Login_Signup_Screen/ForgetPass2.dart';

// class ForgetPassOne extends StatefulWidget {
//   const ForgetPassOne({super.key});

//   @override
//   State<ForgetPassOne> createState() => _ForgetPassOneState();
// }

// class _ForgetPassOneState extends State<ForgetPassOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Row(
//               children: [
//                 const SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Icon(Icons.arrow_back, color: Colors.black),
//                 ),
//                 const SizedBox(width: 50),
//                 const Text(
//                   "Forget Password",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             const CircleAvatar(
//               backgroundImage: AssetImage("assets/forgetpass4.png"),
//               radius: 70,
//               backgroundColor: Colors.transparent,
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Please Enter Your Email Address to",
//               style: TextStyle(color: Colors.black54),
//             ),
//             const Text(
//               "Receive a Verification Code",
//               style: TextStyle(color: Colors.black54),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 height: 105,
//                 child: Card(
//                   color: Colors.grey[100],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 2,
//                   child: const Padding(
//                     padding: EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Enter your Email Address",
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                         SizedBox(height: 0),
//                         TextField(
//                           cursorColor: Colors.green,
//                           decoration: InputDecoration(
//                             border: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.green),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.green),
//                             ),
//                             errorBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.red),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             const Text(
//               "Try Another Way",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//               width: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 gradient: const LinearGradient(
//                   colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 4,
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => ForgetPassTwo()));
//                 },
//                 child: const Text(
//                   "Send",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:language_page/Login_Signup_Screen/ForgetPass2.dart';
// import 'package:language_page/Login_Signup_Screen/Login_page.dart';

// class ForgetPassOne extends StatefulWidget {
//   const ForgetPassOne({super.key});

//   @override
//   State<ForgetPassOne> createState() => _ForgetPassOneState();
// }

// class _ForgetPassOneState extends State<ForgetPassOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Row(
//               children: [
//                 const SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Icon(Icons.arrow_back, color: Colors.black),
//                 ),
//                 const SizedBox(width: 50),
//                 const Text(
//                   "Forget Password",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             const CircleAvatar(
//               backgroundImage: AssetImage("assets/forgetpass4.png"),
//               radius: 70,
//               backgroundColor: Colors.transparent,
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Please Enter Your Email Address to",
//               style: TextStyle(color: Colors.black54),
//             ),
//             const Text(
//               "Receive a Verification Code",
//               style: TextStyle(color: Colors.black54),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 height: 105,
//                 child: Card(
//                   color: Colors.grey[100],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 2,
//                   child: const Padding(
//                     padding: EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Enter your Email Address",
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                         SizedBox(height: 0),
//                         TextField(
//                           cursorColor: Colors.green,
//                           decoration: InputDecoration(
//                             border: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.green),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.green),
//                             ),
//                             errorBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.red),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             const Text(
//               "Try Another Way",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//               width: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 gradient: const LinearGradient(
//                   colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 4,
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => ForgetPassTwo()));
//                 },
//                 child: const Text(
//                   "Send",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ForgetPassTwo extends StatefulWidget {
//   const ForgetPassTwo({super.key});

//   @override
//   State<ForgetPassTwo> createState() => _ForgetPassTwoState();
// }

// class _ForgetPassTwoState extends State<ForgetPassTwo> {
//   final List<TextEditingController> otpControllers =
//       List.generate(4, (index) => TextEditingController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(height: 50),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(width: 50),
//                   const Text(
//                     "Verify Your Email",
//                     style: TextStyle(
//                       fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               const CircleAvatar(
//                 backgroundImage: AssetImage("assets/forgetpass2.png"),
//                 radius: 70,
//                 backgroundColor: Colors.transparent,
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Please enter the 4-digit code",
//                 style: TextStyle(
//                     fontSize: 16,color: Colors.black54,fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 "to verify your email",
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(4, (index) {
//                   return Container(
//                     width: 50,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,blurRadius: 6,offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       cursorColor: Colors.green,
//                       controller: otpControllers[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       maxLength: 1,
//                       onChanged: (value) {
//                         if (value.isNotEmpty && index < 3) {
//                           FocusScope.of(context).nextFocus();
//                         } else if (value.isEmpty && index > 0) {
//                           FocusScope.of(context).previousFocus();
//                         }
//                       },
//                       decoration: const InputDecoration(
//                         counterText: "",
//                         border: InputBorder.none,
//                       ),
//                       style: const TextStyle(
//                         fontSize: 22,color: Colors.green,fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//               const SizedBox(height: 30),
//               TextButton(
//                 onPressed: () {
//                   // Add resend code logic
//                 },
//                 child: const Text(
//                   "Resend Code",
//                   style: TextStyle(
//                     fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   gradient: const LinearGradient(
//                     colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {
//                     String otp = otpControllers
//                         .map((controller) => controller.text)
//                         .join();
//                     print("Entered OTP: $otp");
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ForgetPassThree()));
//                   },
//                   child: const Text(
//                     "Verify OTP",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ForgetPassThree extends StatefulWidget {
//   const ForgetPassThree({super.key});
//   @override
//   State<ForgetPassThree> createState() => _ForgetPassThreeState();
// }
// class _ForgetPassThreeState extends State<ForgetPassThree> {
//   bool _isObscured = true;
//   bool _isObscured1 = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Row(
//               children: [
//                 const SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Icon(Icons.arrow_back, color: Colors.black54),
//                 ),
//                 const SizedBox(width: 30),
//                 const Text(
//                   "Create New Password",
//                   style: TextStyle(
//                     fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//             const CircleAvatar(
//               backgroundImage: AssetImage("assets/forgetpass3.png"),
//               radius: 70,
//               backgroundColor: Colors.transparent,
//             ),
//             const SizedBox(height: 25),
//             const Text(
//               "Your new password must be different",
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                   fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "from previously used passwords",
//               style: TextStyle(
//                   fontSize: 16,color: Colors.black54,fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Card(
//                 color: Colors.grey[100],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Enter New Password",
//                         style: TextStyle(
//                           fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black87,
//                         ),
//                       ),
//                       TextField(
//                         obscureText: !_isObscured1,
//                         cursorColor: Colors.green,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isObscured1
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.green,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isObscured1 = !_isObscured1;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Card(
//                 color: Colors.grey[100],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Confirm Password",
//                         style: TextStyle(
//                           fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black87,
//                         ),
//                       ),
//                       TextField(
//                         obscureText: !_isObscured,
//                         cursorColor: Colors.green,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isObscured
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.green,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isObscured = !_isObscured;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 gradient: const LinearGradient(
//                   colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const LoginPage()),
//                       (route) => false);
//                 },
//                 child: const Text(
//                   "Save",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:language_page/Login_Signup_Screen/Login_page.dart';

class ForgetPassOne extends StatefulWidget {
  const ForgetPassOne({Key? key}) : super(key: key);

  @override
  State<ForgetPassOne> createState() => _ForgetPassOneState();
}

class _ForgetPassOneState extends State<ForgetPassOne> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        SizedBox(
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
                          Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/forgetpass4.png"),
              radius: 70,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 30),
            const Text("Please Enter Your Email Address to"),
            const Text("Receive a Verification Code"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Email Address",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                // Show alternative recovery options
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Try Another Way"),
                    content:
                        const Text("Use mobile number or security question."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "Try Another Way",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ForgetPassTwo(email: emailController.text),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPassTwo extends StatefulWidget {
  final String email;
  const ForgetPassTwo({Key? key, required this.email}) : super(key: key);

  @override
  State<ForgetPassTwo> createState() => _ForgetPassTwoState();
}

class _ForgetPassTwoState extends State<ForgetPassTwo> {
  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  String otp = '';

  @override
  void initState() {
    super.initState();
    _generateOtp();
  }

  void _generateOtp() {
    final random = Random();
    otp = List.generate(4, (_) => random.nextInt(10).toString()).join();
    print("Generated OTP: $otp"); // For testing purposes
    _showOtpPopup();
  }

  void _showOtpPopup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Your OTP is $otp",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 10),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
    });
  }

  void _verifyOtp() {
    String enteredOtp = otpControllers.map((c) => c.text).join();
    if (enteredOtp == otp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ForgetPassThree()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Incorrect OTP")),
      );
    }
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
                        SizedBox(
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
                          Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/forgetpass2.png"),
                radius: 70,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 30),
              const Text(
                "Please enter the 4-digit code",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "to verify your email",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      cursorColor: Colors.green,
                      controller: otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  _generateOtp(); // Generate and show new OTP
                },
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    String enteredOtp = otpControllers
                        .map((controller) => controller.text)
                        .join();

                    if (enteredOtp == otp) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassThree()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Invalid OTP. Please try again.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPassThree extends StatefulWidget {
  const ForgetPassThree({Key? key}) : super(key: key);

  @override
  State<ForgetPassThree> createState() => _ForgetPassThreeState();
}

class _ForgetPassThreeState extends State<ForgetPassThree> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _changePassword() {
    if (newPasswordController.text == confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password Changed Successfully")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
    }
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
                        SizedBox(
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
                          Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 26, 77, 28),
                            ),
                          ),
                        ])
                      ])))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/forgetpass3.png"),
                radius: 70,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 25),
              const Text(
                "Your new password must be different",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "from previously used passwords",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text("Create New Password", style: TextStyle(fontSize: 20)),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
              ),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: "Confirm Password"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 91, 236, 75)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    _changePassword();

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginPage(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
