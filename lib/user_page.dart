import 'package:flutter/material.dart';

class UserMain extends StatefulWidget {
  const UserMain({super.key});

  @override
  State<UserMain> createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/background_image.jpg"), // Set your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "User Page - Login Success",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Customize the text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add any functionality you want for the button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Customize the button color
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
