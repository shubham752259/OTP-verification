import 'package:flutter/material.dart';
import 'package:machine_project_2/widget/Uihelper.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UiHelper.customImage(
              img: "mob1.jpg",
              width: double.infinity,
              height: 180,
            ),
            const SizedBox(height: 16),
            UiHelper.customImage(
              img: "mob4.jpg",
              width: double.infinity,
              height: 180,
            ),
            const SizedBox(height: 16),
            UiHelper.customImage(
              img: "mob3.png",
              width: double.infinity,
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
