import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../controllers/forgot_password_controller.dart';
import '../widgets/auth_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
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
    final controller = Get.put(ForgotPasswordController());

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
                child: Obx(
                  () => controller.emailSent.value
                      ? _EmailSentContent(
                          email: controller.emailController.text,
                          onResend: controller.resendEmail,
                        )
                      : _buildFormView(controller),
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
              AppText.forgotPasswordTitle,
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

  Widget _buildFormView(ForgotPasswordController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            // Illustration icon
            Center(
              child: Container(
                width: 96.w,
                height: 96.w,
                decoration: const BoxDecoration(
                  color: AppColors.lightContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_reset_rounded,
                  color: AppColors.primary,
                  size: 52.sp,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            Text(
              AppText.forgotPasswordTitle,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              AppText.forgotPasswordSubtitle,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            // Email field
            AuthFieldLabel(AppText.forgotPasswordEmailLabel),
            SizedBox(height: 6.h),
            TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: controller.validateEmail,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
              decoration: authInputDecoration(
                hint: AppText.emailHint,
                prefixIcon: Icons.email_outlined,
              ),
            ),
            SizedBox(height: 32.h),

            // Send reset link button
            Obx(
              () => AuthPrimaryButton(
                label: AppText.sendResetLink,
                isLoading: controller.isLoading.value,
                onPressed: controller.isLoading.value
                    ? null
                    : controller.sendResetLink,
              ),
            ),
            SizedBox(height: 20.h),

            // Back to login
            Center(
              child: TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 36.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.primary,
                      size: 16.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      AppText.backToLogin,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────── Email Sent success screen ───────────
class _EmailSentContent extends StatefulWidget {
  final String email;
  final VoidCallback onResend;

  const _EmailSentContent({required this.email, required this.onResend});

  @override
  State<_EmailSentContent> createState() => _EmailSentContentState();
}

class _EmailSentContentState extends State<_EmailSentContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 48.h),

          // Animated success icon
          AnimatedBuilder(
            animation: _ctrl,
            builder: (context, child) {
              return Transform.scale(scale: _scale.value, child: child);
            },
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: const BoxDecoration(
                color: Color(0xFFEBFBEE),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mark_email_read_rounded,
                color: AppColors.success,
                size: 56.sp,
              ),
            ),
          ),
          SizedBox(height: 32.h),

          FadeTransition(
            opacity: _fade,
            child: Column(
              children: [
                Text(
                  AppText.emailSentTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  AppText.emailSentSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 40.h),

                // Open email app button
                AuthPrimaryButton(
                  label: AppText.openEmailApp,
                  isLoading: false,
                  onPressed: () {},
                ),
                SizedBox(height: 16.h),

                // Resend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.didntReceiveEmail,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onResend,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 36.h),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        AppText.resendEmail,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Back to login
                TextButton(
                  onPressed: () => Get.back(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 36.h),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.primary,
                        size: 16.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        AppText.backToLogin,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
