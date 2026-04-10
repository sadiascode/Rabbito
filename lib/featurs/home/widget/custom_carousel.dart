import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  CustomCarousel({super.key});

  final List<String> images = [
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",
    "assets/1st.png",

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