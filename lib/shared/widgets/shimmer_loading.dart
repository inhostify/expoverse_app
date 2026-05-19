import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/spacing.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.radiusSmall),
      ),
    ).animate(onPlay: (controller) => controller.repeat())
     .shimmer(
       duration: 1200.ms, 
       color: Colors.white24, 
       angle: 0.5,
     );
  }
}

// Pre-built Skeleton for Cards
class CardSkeleton extends StatelessWidget {
  const CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(width: double.infinity, height: 120.h, borderRadius: BorderRadius.circular(AppSpacing.radiusSmall)),
          SizedBox(height: AppSpacing.md),
          ShimmerLoading(width: 200.w, height: 20.h),
          SizedBox(height: AppSpacing.sm),
          ShimmerLoading(width: 150.w, height: 14.h),
        ],
      ),
    );
  }
}
