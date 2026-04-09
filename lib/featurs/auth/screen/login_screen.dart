import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/featurs/auth/widget/custom_screen.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_color.dart';
import '../widget/custom_textfield.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Color(0xff856DAD) ,
        title: Text("Sign in ", style:
        TextStyle(color: Colors.white),
      ),
      ),
      body: CustomScreen(
        svgHeight: 80,
        svgWidth: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                "Login to Account",
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
                "Please enter your email and password to continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            const Text(
              "User Name",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "Enter your name",
            ),
            const SizedBox(height: 20),
            
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "*********",
              isPassword: true,
            ),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgotScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            CustomButton(
              text: "Sign in",
              onTap: () {
              },
            ),
            
            const SizedBox(height: 24),
            
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade300)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("or", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Expanded(child: Divider(color: Colors.grey.shade300)),
              ],
            ),
            
            const SizedBox(height: 24),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}
