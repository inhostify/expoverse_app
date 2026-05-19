import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';

class TopCategoryIconsRed extends StatelessWidget {
  const TopCategoryIconsRed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRedIconItem(Icons.business_center, 'Business'),
          _buildRedIconItem(Icons.restaurant, 'Food'),
          _buildRedIconItem(Icons.checkroom, 'Fashion'),
          _buildRedIconItem(Icons.computer, 'Tech'),
          _buildRedIconItem(Icons.more_horiz, 'Others'),
        ],
      ),
    );
  }

  Widget _buildRedIconItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
          ),
          child: Icon(
            icon,
            color: Colors.redAccent,
            size: 24.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 10.sp,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
