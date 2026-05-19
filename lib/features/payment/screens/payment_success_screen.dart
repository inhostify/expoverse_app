import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151821), // Deep dark background from image
      body: SafeArea(
        child: Stack(
          children: [
            // Simple Confetti Decoration
            ...List.generate(30, (index) => _buildConfettiParticle()),
            
            Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  
                  // Checkmark Circle
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade600.withOpacity(0.4),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60.sp,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  
                  // Text
                  Text(
                    'Booking Confirmed!',
                    style: AppTypography.h1.copyWith(color: Colors.white, fontSize: 26.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Your booking has been\nconfirmed successfully.',
                    style: AppTypography.bodyMedium.copyWith(color: Colors.white70, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  
                  // Booking ID Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.xl),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222634), // Slightly lighter dark for card
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Booking ID',
                          style: AppTypography.bodyMedium.copyWith(color: Colors.white54),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'EXPO1132025',
                          style: AppTypography.h2.copyWith(color: Colors.white, letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Bottom Buttons
                  PremiumButton(
                    text: 'View Booking',
                    onPressed: () {
                      // Navigate to profile/bookings if exists, else home
                      context.go('/home');
                    },
                  ),
                  SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                        ),
                      ),
                      child: Text(
                        'Go to Home',
                        style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfettiParticle() {
    final random = Random();
    final isCircle = random.nextBool();
    final colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green, Colors.orange];
    final color = colors[random.nextInt(colors.length)];
    
    return Positioned(
      left: random.nextDouble() * 400.w,
      top: random.nextDouble() * 400.h,
      child: Transform.rotate(
        angle: random.nextDouble() * pi,
        child: Container(
          width: 6.w + random.nextDouble() * 6.w,
          height: isCircle ? (6.w + random.nextDouble() * 6.w) : (8.h + random.nextDouble() * 8.h),
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(2.r),
          ),
        ),
      ),
    );
  }
}
