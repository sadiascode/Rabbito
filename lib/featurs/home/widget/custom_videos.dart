import 'package:flutter/material.dart';

class CustomVideos extends StatelessWidget {
  CustomVideos({super.key});

  final List<String> images = [

    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",
    "assets/5th.png",


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}