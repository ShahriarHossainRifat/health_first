import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      // TODO: Replace with actual login API call
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      Get.offAllNamed(AppRoute.getHomeScreen());
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
