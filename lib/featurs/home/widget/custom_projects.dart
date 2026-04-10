import 'package:flutter/material.dart';

class CustomProjects extends StatelessWidget {
  CustomProjects({super.key});

  final List<String> images = [
    "assets/1st.png",
    "assets/2nd.png",
    "assets/3rd.png",
    "assets/5th.png",
    "assets/3rd.png",
    "assets/2nd.png",
    "assets/5th.png",
    "assets/1st.png",
    "assets/2nd.png",
    "assets/1st.png",
    "assets/5th.png",
    "assets/3rd.png",

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}