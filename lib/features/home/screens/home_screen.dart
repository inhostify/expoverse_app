import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_header.dart';
import '../widgets/hero_banner.dart';
import '../widgets/category_list.dart'; // keeping this in case it's used elsewhere, but using new CategoriesGrid
import '../widgets/categories_grid.dart';
import '../widgets/best_event_box.dart';
import '../widgets/ad_banner.dart';
import '../widgets/browse_events_slider.dart';
import '../widgets/exhibition_list.dart';
import '../widgets/top_action_icons.dart';
import '../widgets/top_category_icons_red.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(),
                  SizedBox(height: AppSpacing.sm),
                  
                  // Top 5 Red Category Icons
                  const TopCategoryIconsRed(),
                  SizedBox(height: AppSpacing.md),
                  
                  // 1. Banner Slider
                  const HeroBanner(),
                  SizedBox(height: 30.h),
                  
                  // 2. Upcoming Exhibitions
                  const ExhibitionList(title: 'Upcoming Exhibitions'),
                  SizedBox(height: 30.h),
                  
                  // Top 4 Action Icons moved here
                  const TopActionIcons(),
                  SizedBox(height: 40.h),
                  
                  // 3. Categories Slider
                  const CategoriesGrid(),
                  SizedBox(height: 40.h),
                  
                  // 4. Best Event This Week Box (With distinct background)
                  Container(
                    width: double.infinity,
                    color: AppColors.surface,
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: const BestEventBox(),
                  ),
                  SizedBox(height: 40.h),
                  
                  // 5. Ad Banner (Full Width)
                  const AdBanner(),
                  SizedBox(height: 40.h),
                  
                  // 6. Previous Exhibitions
                  const ExhibitionList(title: 'Previous Exhibitions'),
                  SizedBox(height: 40.h),
                  
                  // 7. Browse Events By Category (With distinct background)
                  Container(
                    width: double.infinity,
                    color: AppColors.surface.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: const BrowseEventsSlider(),
                  ),
                  
                  SizedBox(height: 120.h), // Extra space for bottom nav and floating button
                ],
              ),
            ),
          ),
          
          // Floating Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                if (index == 3) {
                  context.push('/profile');
                } else {
                  setState(() {
                    _currentIndex = index;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
