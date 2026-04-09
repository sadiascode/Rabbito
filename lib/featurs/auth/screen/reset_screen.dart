import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/featurs/auth/screen/login_screen.dart';
import 'package:web/featurs/auth/widget/custom_screen.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_color.dart';
import '../widget/custom_textfield.dart';


class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Color(0xff856DAD) ,
        title: Text("Reset Password ", style:
        TextStyle(color: Colors.white),
        ),
      ),
      body: CustomScreen(
        svgHeight: 80,
        svgWidth: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/logo.svg',
                height: 80,
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Set a new password",
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
                "Create a new password. Ensure it differs from previous ones for security",
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
                "New Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "******",
              isPassword: true,
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "******",
              isPassword: true,
            ),
            const SizedBox(height: 20),


            CustomButton(
              text: "Continue",
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
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
