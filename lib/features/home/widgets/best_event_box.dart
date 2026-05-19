import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class BestEventBox extends StatelessWidget {
  const BestEventBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text('Best Events This Week', style: AppTypography.h3),
        ),
        SizedBox(height: AppSpacing.sm),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              // Image
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ai_tech_expo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.md),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tech Innovation Expo', style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4.h),
                    Text('Hitex, Hyderabad', style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
                    SizedBox(height: 4.h),
                    Text('11 - 13 May 2025', style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 90.w,
                        height: 30.h,
                        child: PremiumButton(
                          text: 'Book Now',
                          onPressed: () {
                            context.push('/exhibition_details');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
