import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

bool isLoading = false;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          duration: Duration(milliseconds: 2),
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                  color: Color(0xFF2E7D32), shape: BoxShape.circle),
            );
          },
        ),
      ),
    );
  }
}
