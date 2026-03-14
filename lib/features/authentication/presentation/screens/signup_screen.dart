import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/validators/app_validator.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/auth_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeIn),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0.0, 0.18),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 28.h),
                        Text(
                          AppText.signUpTitle,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          AppText.signUpSubtitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 28.h),

                        // Full name
                        AuthFieldLabel(AppText.fullNameLabel),
                        SizedBox(height: 6.h),
                        TextFormField(
                          controller: controller.fullNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          validator: controller.validateFullName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: authInputDecoration(
                            hint: AppText.fullNameHint,
                            prefixIcon: Icons.person_outline_rounded,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Email
                        AuthFieldLabel(AppText.emailLabel),
                        SizedBox(height: 6.h),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: AppValidator.validateEmail,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimary,
                          ),
                          decoration: authInputDecoration(
                            hint: AppText.emailHint,
                            prefixIcon: Icons.email_outlined,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Password
                        AuthFieldLabel(AppText.passwordLabel),
                        SizedBox(height: 6.h),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: !controller.isPasswordVisible.value,
                            textInputAction: TextInputAction.next,
                            validator: AppValidator.validatePassword,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                            decoration: authInputDecoration(
                              hint: AppText.passwordHint,
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20.sp,
                                ),
                                onPressed: controller.togglePasswordVisibility,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Confirm password
                        AuthFieldLabel(AppText.confirmPasswordLabel),
                        SizedBox(height: 6.h),
                        Obx(
                          () => TextFormField(
                            controller: controller.confirmPasswordController,
                            obscureText:
                                !controller.isConfirmPasswordVisible.value,
                            textInputAction: TextInputAction.done,
                            validator: controller.validateConfirmPassword,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                            decoration: authInputDecoration(
                              hint: AppText.confirmPasswordHint,
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20.sp,
                                ),
                                onPressed:
                                    controller.toggleConfirmPasswordVisibility,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        // Sign up button
                        Obx(
                          () => AuthPrimaryButton(
                            label: AppText.signUp,
                            isLoading: controller.isLoading.value,
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.signUp,
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // Sign in link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppText.alreadyHaveAccount,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.back(),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 36.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                AppText.signIn,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return AuthHeader(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 8.h, 24.w, 24.h),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              AppText.signUpTitle,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
