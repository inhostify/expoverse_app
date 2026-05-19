import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Full Screen Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .scaleXY(begin: 1.0, end: 1.1, duration: 15.seconds)
             .move(begin: const Offset(-10, 0), end: const Offset(10, 0), duration: 15.seconds),
          ),
          
          // Dark Gradient Overlay for readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  
                  // App Name
                  Text(
                    'ExpoVerse',
                    style: AppTypography.h1.copyWith(
                      fontSize: 44.sp,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                  
                  SizedBox(height: AppSpacing.sm),
                  
                  // Tagline
                  Text(
                    'Discover. Book. Exhibit.',
                    style: AppTypography.bodyLarge.copyWith(
                      color: Colors.white70,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                  
                  const Spacer(),
                  
                  // Action Buttons
                  PremiumButton(
                    text: 'Get Started',
                    onPressed: () {
                      context.go('/login'); // Routing to login
                    },
                  ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
                  
                  SizedBox(height: AppSpacing.md),
                  
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      context.go('/login'); // Routing to login
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                    child: Text(
                      'Skip',
                      style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ).animate().fadeIn(delay: 800.ms),
                  
                  SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
