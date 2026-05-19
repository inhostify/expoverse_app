import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';

class TopActionIcons extends StatelessWidget {
  const TopActionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionItem(Icons.calendar_month, 'Upcoming\nExhibitions', const Color(0xFFE91E63)), // Pinkish red
          _buildActionItem(Icons.history, 'Previous\nExhibitions', const Color(0xFFFF9800)), // Orange
          _buildActionItem(Icons.storefront, 'Stalls', const Color(0xFF9C27B0)), // Purple
          _buildActionItem(Icons.apps, 'Other', const Color(0xFF673AB7)), // Deep purple
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: color.withOpacity(0.5)),
          ),
          child: Icon(
            icon,
            color: color,
            size: 28.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
