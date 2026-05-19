import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151821), // Dark sleek theme
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Profile Info
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
                  child: Row(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white24, width: 2),
                          image: const DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rahul Sharma', style: AppTypography.h3.copyWith(color: Colors.white)),
                            SizedBox(height: 4.h),
                            Text('rahulsharma@email.com', style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
                            SizedBox(height: 2.h),
                            Text('+91 98765 43210', style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.qr_code_scanner, color: Colors.white70, size: 24.sp),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                Divider(color: Colors.white12, thickness: 1, height: 1),
                
                // Menu Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    children: [
                      _buildMenuItem(context, Icons.assignment_outlined, 'My Bookings', route: '/my_bookings'),
                      _buildMenuItem(context, Icons.local_offer_outlined, 'Offers & Coupons', route: '/offers_coupons'),
                      _buildMenuItem(context, Icons.edit_outlined, 'Edit Profile', route: '/edit_profile'),
                      _buildMenuItem(context, Icons.receipt_long_outlined, 'Payment History'),
                      _buildMenuItem(context, Icons.favorite_border, 'Saved Events'),
                      _buildMenuItem(context, Icons.notifications_none_outlined, 'Notifications'),
                      _buildMenuItem(context, Icons.info_outline, 'Help & Support'),
                      _buildMenuItem(context, Icons.logout, 'Logout', isDestructive: true),
                      SizedBox(height: 100.h), // Spacing to avoid bottom nav bar overlap
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(
              currentIndex: 3, // Profile is index 3
              onTap: (index) {
                if (index == 0) {
                  context.go('/home');
                } else if (index == 3) {
                  // Already on Profile
                } else {
                  // Handle other tabs if they exist, or fallback to home
                  context.go('/home');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {String? route, bool isDestructive = false}) {
    return InkWell(
      onTap: () {
        if (route != null) {
          context.push(route);
        } else if (isDestructive) {
          context.go('/login');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? Colors.red.shade400 : Colors.white70, size: 24.sp),
            SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyLarge.copyWith(
                  color: isDestructive ? Colors.red.shade400 : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white38, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
