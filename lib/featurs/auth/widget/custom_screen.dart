import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatefulWidget {
  final String svgPath;
  final double svgHeight;
  final double svgWidth;
  final Widget child;

  const CustomScreen({
    super.key,
    required this.svgPath,
    required this.svgHeight,
    required this.svgWidth,
    required this.child,
  });

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
          ),
        ),

        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Center(
            child: SvgPicture.asset(
              widget.svgPath,
              height: widget.svgHeight * 0.4, 
              width: widget.svgWidth * 0.4,
            ),
          ),
        ),

        // Main content card
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.75,
            widthFactor: 1.0,
            child: Container(
              padding: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(32),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}