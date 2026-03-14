import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/validators/app_validator.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/login_controller.dart';
import '../widgets/auth_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
    final controller = Get.put(LoginController());

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
                          AppText.loginTitle,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          AppText.loginSubtitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 28.h),

                        // Email field
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

                        // Password field
                        AuthFieldLabel(AppText.passwordLabel),
                        SizedBox(height: 6.h),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: !controller.isPasswordVisible.value,
                            textInputAction: TextInputAction.done,
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
                        SizedBox(height: 6.h),

                        // Forgot password link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => Get.toNamed(
                                AppRoute.getForgotPasswordScreen()),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 36.h),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              AppText.forgotPassword,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // Login button
                        Obx(
                          () => AuthPrimaryButton(
                            label: AppText.login,
                            isLoading: controller.isLoading.value,
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.login,
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppText.dontHaveAccount,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Get.toNamed(AppRoute.getSignUpScreen()),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 36.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                AppText.signUp,
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
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 28.h),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.health_and_safety_rounded,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              AppText.appName,
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
