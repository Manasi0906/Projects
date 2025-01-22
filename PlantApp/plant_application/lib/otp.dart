
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_application/homePage.dart';

void main() {
  return runApp(const otpPage(verificationId: ''));
}

class otpPage extends StatefulWidget {
  final String verificationId;

  const otpPage({super.key, required this.verificationId});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  TextEditingController otp1controller = TextEditingController();
  TextEditingController otp2controller = TextEditingController();
  TextEditingController otp3controller = TextEditingController();
  TextEditingController otp4controller = TextEditingController();
  TextEditingController otp5controller = TextEditingController();
  TextEditingController otp6controller = TextEditingController();

  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focus4 = FocusNode();
  final FocusNode focus5 = FocusNode();
  final FocusNode focus6 = FocusNode();

   @override
  void dispose() {
    otp1controller.dispose();
    otp2controller.dispose();
    otp3controller.dispose();
    otp4controller.dispose();
    otp5controller.dispose();
    otp6controller.dispose();

    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    focus5.dispose();
    focus6.dispose();
    super.dispose();
  }

  Widget otpInputField(
      TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [BoxShadow(blurStyle: BlurStyle.outer)],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: const TextInputType.numberWithOptions(),
        controller: controller,
        maxLength: 1,
        focusNode: currentFocus,
        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move to the next field if available
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus(); // Unfocus if it's the last field
            }
          }
        },
        decoration: const InputDecoration(
          counterText: "", // Removes the character counter
          border: InputBorder.none,
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void verifyOTP() async {
    String otp =
        otp1controller.text + otp2controller.text + otp3controller.text + otp4controller.text+otp5controller.text+otp6controller.text;

    if (otp.length == 6) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otp,
        );

        await _auth.signInWithCredential(credential);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Verification successful!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit OTP.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.arrow_back),
                ],
              ),
              Container(
                child: Image.asset("assets/plant4.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Enter the OTP code from the phone we \njust sent you.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otpInputField(otp1controller, focus1, focus2),
              otpInputField(otp2controller, focus2, focus3),
              otpInputField(otp3controller, focus3, focus4),
              otpInputField(otp4controller, focus4, focus5),
              otpInputField(otp5controller, focus5, focus6),
              otpInputField(otp6controller, focus6, null),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Don’t receive OTP code! ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Resend",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: verifyOTP,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 340,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(62, 102, 24, 1),
                          Color.fromRGBO(124, 180, 70, 1)
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 12, bottom: 11, left: 52, right: 53),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//   Widget otpInputField(TextEditingController controller) {
//     return Container(
//       height: 50,
//       width: 50,
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         boxShadow: const [BoxShadow(blurStyle: BlurStyle.outer)],
//       ),
//       child: TextField(
//         textAlign: TextAlign.center,
//         keyboardType: const TextInputType.numberWithOptions(),
//         controller: controller,
//         decoration: const InputDecoration(labelStyle: TextStyle(fontSize: 34)),
//       ),
//     );
//   }
// }
}