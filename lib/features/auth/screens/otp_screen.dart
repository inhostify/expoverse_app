import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verify Phone', style: AppTypography.h1),
              SizedBox(height: AppSpacing.xs),
              Text('We have sent a 6-digit code to your phone number.', style: AppTypography.bodyMedium),
              
              SizedBox(height: 40.h),
              
              // Simple OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) => _buildOtpBox()),
              ),
              
              SizedBox(height: AppSpacing.xl),
              
              PremiumButton(
                text: 'Verify & Continue',
                onPressed: () {
                  context.go('/home');
                },
              ),
              
              SizedBox(height: AppSpacing.lg),
              
              Center(
                child: Text(
                  'Resend Code in 00:30',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox() {
    return Container(
      width: 45.w,
      height: 55.w,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        border: Border.all(color: AppColors.primary.withOpacity(0.5)),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: AppTypography.h2,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
