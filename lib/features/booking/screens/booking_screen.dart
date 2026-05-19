import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int bookingDays = 2;
  String selectedStallSize = '3m x 3m';

  // Map to hold prices for different stall sizes
  final Map<String, String> stallPrices = {
    '2m x 2m': '₹ 15,000 / Stall',
    '3m x 3m': '₹ 25,000 / Stall',
    '5m x 5m': '₹ 45,000 / Stall',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: AppSpacing.sm),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
          children: [
            // 1. Date & Time
            _buildListItem(
              icon: Icons.calendar_today_outlined,
              title: 'Date & Time',
              subtitleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('12 May 2025 - 16 May 2025', style: AppTypography.bodySmall.copyWith(color: Colors.black54)),
                  SizedBox(height: 2.h),
                  Text('10:00 AM - 06:00 PM', style: AppTypography.bodySmall.copyWith(color: Colors.black54)),
                ],
              ),
            ),
            _buildDivider(),

            // 2. Stall Size (Dropdown)
            _buildListItem(
              icon: Icons.assignment_turned_in_outlined,
              title: 'Stall Size',
              subtitleWidget: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedStallSize,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 20),
                  isDense: true,
                  style: AppTypography.bodySmall.copyWith(color: Colors.black54),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedStallSize = newValue;
                      });
                    }
                  },
                  items: ['2m x 2m', '3m x 3m', '5m x 5m']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            _buildDivider(),

            // 3. Price
            _buildListItem(
              icon: Icons.sell_outlined,
              title: 'Price',
              subtitleWidget: Text(
                stallPrices[selectedStallSize] ?? '₹ 25,000 / Stall', 
                style: AppTypography.bodySmall.copyWith(color: Colors.black54)
              ),
            ),
            _buildDivider(),

            // 4. Materials Included
            _buildListItem(
              icon: Icons.inventory_2_outlined,
              title: 'Materials Included',
              subtitleWidget: Text(
                'Table, Chair, Light, Power Socket', 
                style: AppTypography.bodySmall.copyWith(color: Colors.black54)
              ),
            ),
            _buildDivider(),

            // 5. Book For (Stepper)
            _buildListItem(
              icon: Icons.bookmark_add_outlined,
              title: 'Book For',
              subtitleWidget: Text(
                '$bookingDays Days', 
                style: AppTypography.bodySmall.copyWith(color: Colors.black54)
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        if (bookingDays > 1) {
                          setState(() => bookingDays--);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Icon(Icons.remove, size: 16.sp, color: Colors.black87),
                      ),
                    ),
                    Container(width: 1, height: 20.h, color: Colors.grey.shade300),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        '$bookingDays', 
                        style: AppTypography.bodyMedium.copyWith(color: Colors.black87, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(width: 1, height: 20.h, color: Colors.grey.shade300),
                    InkWell(
                      onTap: () {
                        if (bookingDays < 6) {
                          setState(() => bookingDays++);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Icon(Icons.add, size: 16.sp, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
          ],
        ),
      ),
      
      // Bottom Button
      bottomNavigationBar: Container(
        color: Colors.white, // White background for the bottom bar
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: PremiumButton(
              text: 'Check Availability',
              onPressed: () {
                context.push('/interactive_stall', extra: selectedStallSize);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required Widget subtitleWidget,
    Widget? trailing,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Box
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(icon, color: Colors.black87, size: 24.sp),
          ),
          SizedBox(width: AppSpacing.md),
          
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                subtitleWidget,
              ],
            ),
          ),
          
          // Trailing widget (if any)
          if (trailing != null) ...[
            SizedBox(width: AppSpacing.md),
            trailing,
          ],
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Divider(color: Colors.grey.shade200, thickness: 1, height: 1),
    );
  }
}
