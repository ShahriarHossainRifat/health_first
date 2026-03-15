import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_first/core/utils/widgets/custom_button.dart';
import 'package:health_first/core/utils/widgets/custom_text_field.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Enter your email address to get an OTP code to reset your password.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextField(
                hintText: 'Email',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                title: 'Get OTP',
                onPressed: () {
                  Get.to(const OTPScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
