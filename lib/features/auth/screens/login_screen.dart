import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:advance_ui/core/theme/app_colors.dart';
import 'package:advance_ui/core/theme/app_text_styles.dart';
import 'package:advance_ui/core/utils/constants.dart';
import 'package:advance_ui/shared/widgets/glass_card.dart';
import 'package:advance_ui/shared/widgets/custom_button.dart';
import 'package:advance_ui/shared/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Layer 1 — gradient background
          _buildGradientBackground(),

          // Layer 2 — top left glow circle
          _buildBlurCircle(
            top: -80,
            left: -60,
            color: AppColors.primary.withOpacity(0.5),
            size: 280,
          ),

          // Layer 3 — bottom right glow circle
          _buildBlurCircle(
            bottom: -60,
            right: -40,
            color: AppColors.secondary.withOpacity(0.4),
            size: 250,
          ),

          // Layer 4 — main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    const Icon(
                          Icons.blur_on_rounded,
                          size: 60,
                          color: AppColors.primary,
                        )
                        .animate()
                        .fadeIn(duration: AppConstants.animSlow)
                        .scale(begin: const Offset(0.5, 0.5)),

                    const SizedBox(height: AppConstants.paddingMedium),

                    // Title
                    const Text(
                      'Welcome Back',
                      style: AppTextStyles.heading1,
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                    const SizedBox(height: AppConstants.paddingSmall),

                    // Subtitle
                    const Text(
                      'Sign in to continue',
                      style: AppTextStyles.caption,
                    ).animate().fadeIn(delay: 300.ms),

                    const SizedBox(height: AppConstants.paddingXL),

                    // Glass card with form
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            hint: 'Email address',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: AppConstants.paddingMedium),
                          const CustomTextField(
                            hint: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                          ),
                          const SizedBox(height: AppConstants.paddingSmall),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppConstants.paddingLarge),
                          CustomButton(label: 'Sign In', onPressed: () {}),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),

                    const SizedBox(height: AppConstants.paddingLarge),

                    // Sign up row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: AppTextStyles.caption,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 600.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.background, Color(0xFF1A0A2E), AppColors.surface],
        ),
      ),
    );
  }

  Widget _buildBlurCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Color color,
    required double size,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
