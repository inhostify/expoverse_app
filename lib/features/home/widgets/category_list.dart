import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.business, 'name': 'Business'},
      {'icon': Icons.restaurant, 'name': 'Food'},
      {'icon': Icons.checkroom, 'name': 'Fashion'},
      {'icon': Icons.computer, 'name': 'Tech'},
      {'icon': Icons.more_horiz, 'name': 'Other'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return Column(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white10),
                ),
                child: Center(
                  child: Icon(
                    category['icon'] as IconData,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                category['name'] as String,
                style: AppTypography.bodySmall,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
