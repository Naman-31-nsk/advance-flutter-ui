import 'package:flutter/material.dart';
import 'package:advance_ui/core/theme/app_colors.dart';
import 'package:advance_ui/core/theme/app_text_styles.dart';
import 'package:advance_ui/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final List<Color>? gradientColors;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? AppColors.primaryGradient,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
              : Text(label, style: AppTextStyles.buttonText),
        ),
      ),
    );
  }
}
