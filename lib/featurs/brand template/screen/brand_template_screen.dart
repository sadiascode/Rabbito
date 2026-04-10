import 'package:flutter/material.dart';
import '../../../common/custom_color.dart';

class BrandTemplateScreen extends StatefulWidget {
  const BrandTemplateScreen({super.key});

  @override
  State<BrandTemplateScreen> createState() => _BrandTemplateScreenState();
}

class _BrandTemplateScreenState extends State<BrandTemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Brand Templates",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Design your brand templates here",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
