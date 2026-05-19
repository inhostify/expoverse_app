import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../design_system/gradients.dart';
import '../../../shared/widgets/premium_button.dart';

class ExhibitionDetailsScreen extends StatelessWidget {
  const ExhibitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Large Event Banner
          SliverAppBar(
            expandedHeight: 280.h,
            pinned: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: () => context.pop(),
            ),
            title: Text('India Trade Fair 2025', style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/ai_trade_expo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Details Content
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.background,
              child: Column(
                children: [
                  // --- THE WHITE CARD ---
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                    ),
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'India Trade Fair 2025',
                          style: AppTypography.h1.copyWith(color: Colors.black, fontSize: 24.sp),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        
                        // Location
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.black54, size: 18.sp),
                            SizedBox(width: 6.w),
                            Text(
                              'Pragati Maidan, Delhi',
                              style: AppTypography.bodyMedium.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        
                        // Date & Time
                        Row(
                          children: [
                            Icon(Icons.schedule, color: Colors.black54, size: 18.sp),
                            SizedBox(width: 6.w),
                            Text(
                              '12 - 16 May 2025',
                              style: AppTypography.bodySmall.copyWith(color: Colors.black87),
                            ),
                            SizedBox(width: 16.w),
                            Icon(Icons.access_time, color: Colors.black54, size: 18.sp),
                            SizedBox(width: 6.w),
                            Text(
                              '10:00 AM - 06:00 PM',
                              style: AppTypography.bodySmall.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.md),
                        
                        // Tags
                        Row(
                          children: [
                            _buildTag('Business Expo'),
                            SizedBox(width: AppSpacing.sm),
                            _buildTag('Trade Show'),
                          ],
                        ),
                        
                        SizedBox(height: AppSpacing.md),
                        Divider(color: Colors.grey.shade200, thickness: 1),
                        SizedBox(height: AppSpacing.md),
                        
                        // Booking Status
                        Text('Booking Status', style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(height: AppSpacing.xs),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Available Stalls', style: AppTypography.bodyLarge.copyWith(color: Colors.black87, fontWeight: FontWeight.w600)),
                            Text('120', style: AppTypography.h1.copyWith(color: Colors.green.shade600, fontSize: 28.sp)),
                          ],
                        ),
                        
                        SizedBox(height: AppSpacing.md),
                        Divider(color: Colors.grey.shade200, thickness: 1),
                        SizedBox(height: AppSpacing.md),
                        
                        // Top Reviews
                        Text('Top Reviews', style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(height: AppSpacing.xs),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('4.5 ', style: AppTypography.bodyLarge.copyWith(color: Colors.black87, fontWeight: FontWeight.w600)),
                                Icon(Icons.star, color: Colors.black87, size: 18.sp),
                                SizedBox(width: 8.w),
                                Text('(120 Reviews)', style: AppTypography.bodyMedium.copyWith(color: Colors.black54)),
                              ],
                            ),
                            Text('View All', style: AppTypography.bodyMedium.copyWith(color: Colors.black87)),
                          ],
                        ),
                        
                        SizedBox(height: AppSpacing.lg),
                        
                        // Last Exhibition
                        Text('Last Exhibition', style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(height: AppSpacing.sm),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildThumbnail('assets/images/ai_business_expo.png'),
                            _buildThumbnail('assets/images/ai_food_expo.png'),
                            _buildThumbnail('assets/images/ai_tech_expo.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // --- THE DARK SECTION ---
                  Container(
                    width: double.infinity,
                    color: AppColors.background,
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Testimonials
                        Text('Testimonials', style: AppTypography.h3),
                        SizedBox(height: AppSpacing.md),
                        Container(
                          padding: EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80'),
                                  ),
                                  SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: Text(
                                      'Great platform for business growth and networking.',
                                      style: AppTypography.bodyMedium.copyWith(color: Colors.white, height: 1.4),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Padding(
                                padding: EdgeInsets.only(left: 56.w),
                                child: Text(
                                  '- Rajesh Kumar, Business Owner',
                                  style: AppTypography.bodySmall.copyWith(color: Colors.white54),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: AppSpacing.xl),
                        
                        // Organizer
                        Text('Organizer', style: AppTypography.h3),
                        SizedBox(height: AppSpacing.sm),
                        Text('ExpoVerse Events Pvt. Ltd.', style: AppTypography.bodyMedium.copyWith(color: Colors.white70)),
                        
                        SizedBox(height: AppSpacing.xl),
                        
                        // Team
                        Text('Team', style: AppTypography.h3),
                        SizedBox(height: AppSpacing.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTeamMember('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80', 'Rohit', 'CEO'),
                            _buildTeamMember('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80', 'Anjali', 'Manager'),
                            _buildTeamMember('https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80', 'Vikram', 'Sales'),
                            _buildTeamMember('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80', 'Neha', 'Support'),
                          ],
                        ),
                        
                        SizedBox(height: AppSpacing.xl),
                        
                        // Offer Banner
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: AppSpacing.md),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3B2667), Color(0xFFBC78EC)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Book Early & Get',
                                style: AppTypography.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                '20% OFF',
                                style: AppTypography.h1.copyWith(color: Colors.white, fontSize: 36.sp, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Text(
                                'Limited Time Offer!',
                                style: AppTypography.bodyMedium.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 100.h), // Space for fixed bottom bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Full Width Bottom Button
      bottomNavigationBar: Container(
        color: AppColors.background, // Match the dark background where it overlaps
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: PremiumButton(
              text: 'Book Exhibition',
              onPressed: () {
                context.push('/booking');
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: AppTypography.bodySmall.copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildThumbnail(String imagePath) {
    return Container(
      width: 100.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTeamMember(String imageUrl, String name, String role) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.surface,
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(height: 8.h),
        Text(name, style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 2.h),
        Text(role, style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
      ],
    );
  }
}
