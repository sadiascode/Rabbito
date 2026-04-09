import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/featurs/auth/screen/verify_screen.dart';
import 'package:web/featurs/auth/widget/custom_screen.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_color.dart';
import '../widget/custom_textfield.dart';


class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  bool _rememberMe = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                'assets/logos.png',
                height: 80,
              )
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Please enter your email to get verification code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "admin_tee@gmail.com",
            ),
            const SizedBox(height: 20),


            CustomButton(
              text: "Continue",
              onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const VerifyScreen()),
                  );
              },
            ),

            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}
