import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/glass_card.dart';
import 'package:go_router/go_router.dart';

class ExhibitionList extends StatelessWidget {
  final String title;

  const ExhibitionList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.h3,
              ),
              Text(
                'See All',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              
              // Unique Data Generation based on Title & Index
              final isUpcoming = title.contains('Upcoming');
              
              final List<Map<String, String>> upcomingData = [
                {'title': 'Global Auto Expo', 'image': 'assets/images/ai_auto_expo.png', 'date': 'Oct 20-22, 2026', 'loc': 'Pragati Maidan, Delhi'},
                {'title': 'Tech Innovators', 'image': 'assets/images/ai_upc_tech.png', 'date': 'Nov 10-12, 2026', 'loc': 'Hitex, Hyderabad'},
                {'title': 'Mega Trade Fair', 'image': 'assets/images/ai_trade_expo.png', 'date': 'Dec 05-08, 2026', 'loc': 'BIEC, Bengaluru'},
                {'title': 'Fashion Week', 'image': 'assets/images/ai_fashion_expo.png', 'date': 'Jan 15-18, 2027', 'loc': 'Jio World, Mumbai'},
              ];
              
              final List<Map<String, String>> previousData = [
                {'title': 'Startup Summit', 'image': 'assets/images/ai_prev_startup.png', 'date': 'Jan 10-12, 2024', 'loc': 'JECC, Jaipur'},
                {'title': 'Food Festival', 'image': 'assets/images/ai_food_expo.png', 'date': 'Mar 22-24, 2024', 'loc': 'India Expo, Noida'},
                {'title': 'Handicraft Fair', 'image': 'assets/images/ai_prev_handicraft.png', 'date': 'Jun 05-07, 2024', 'loc': 'Pragati Maidan, Delhi'},
                {'title': 'Builder Expo', 'image': 'assets/images/ai_prev_builder.png', 'date': 'Sep 15-17, 2024', 'loc': 'Hitex, Hyderabad'},
              ];
              
              final item = isUpcoming ? upcomingData[index] : previousData[index];

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: GlassCard(
                  width: 200.w,
                  padding: EdgeInsets.zero,
                  onTap: () {
                    context.push('/exhibition_details');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppSpacing.radiusMedium),
                          ),
                          image: DecorationImage(
                            image: AssetImage(item['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      // Details
                      Padding(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: AppSpacing.xs),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 12.sp, color: AppColors.textSecondary),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    item['loc']!,
                                    style: AppTypography.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSpacing.xs),
                            Row(
                              children: [
                                Icon(Icons.calendar_month, size: 12.sp, color: AppColors.textSecondary),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    item['date']!,
                                    style: AppTypography.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSpacing.sm),
                            // Small button/status
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: isUpcoming ? AppColors.primary.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                                border: Border.all(color: isUpcoming ? AppColors.primary.withOpacity(0.5) : Colors.grey.withOpacity(0.5)),
                              ),
                              child: Text(
                                isUpcoming ? 'Booking Open' : 'Closed',
                                style: AppTypography.bodySmall.copyWith(
                                  color: isUpcoming ? AppColors.primary : Colors.grey, 
                                  fontSize: 10.sp
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
