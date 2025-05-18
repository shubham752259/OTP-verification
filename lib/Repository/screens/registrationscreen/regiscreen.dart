import 'package:flutter/material.dart';
import 'package:machine_project_2/widget/Uihelper.dart';
import 'package:machine_project_2/Repository/screens/NavigationScreen/Navigationscreen.dart';

class regiscreen extends StatefulWidget {
  const regiscreen({super.key});

  @override
  State<regiscreen> createState() => _regiscreenState();
}

class _regiscreenState extends State<regiscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              UiHelper.customImage(
                img: "deal.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 30),
              UiHelper.CustomText(
                text: "Let's Begin!",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(height: 10),
              UiHelper.CustomText(
                text: "Please enter your credentials to proceed",
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              const SizedBox(height: 30),

              // Email Field
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Create Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Referral Code Field
              TextField(
                controller: referralController,
                decoration: InputDecoration(
                  hintText: 'Referral Code (optional)',
                  prefixIcon: const Icon(Icons.card_giftcard),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Handle Firebase registration logic here if needed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const navigationscreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE23744),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
