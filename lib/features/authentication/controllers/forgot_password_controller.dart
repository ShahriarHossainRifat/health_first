import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  var isLoading = false.obs;
  var emailSent = false.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  Future<void> sendResetLink() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      // TODO: Replace with actual forgot-password API call
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      emailSent.value = true;
    }
  }

  void resendEmail() {
    emailSent.value = false;
    sendResetLink();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
