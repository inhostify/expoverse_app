import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';
import 'package:flutter/services.dart';

class InteractiveStallScreen extends StatefulWidget {
  final String selectedStallSize;

  const InteractiveStallScreen({
    super.key,
    required this.selectedStallSize,
  });

  @override
  State<InteractiveStallScreen> createState() => _InteractiveStallScreenState();
}

class _InteractiveStallScreenState extends State<InteractiveStallScreen> {
  // Pre-booked stalls
  final List<int> bookedStalls = [103, 108];
  
  int? selectedStall;

  // Determine size based on stall number
  String getStallSize(int stallNumber) {
    if (stallNumber >= 101 && stallNumber <= 105) return '2m x 2m';
    if (stallNumber >= 106 && stallNumber <= 115) return '3m x 3m';
    if (stallNumber >= 116 && stallNumber <= 120) return '5m x 5m';
    return '3m x 3m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Match dark app bar style from before
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text('8. Stall Layout / Availability', style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: AppSpacing.sm),
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.sm),
            Text('Select Your Stall', style: AppTypography.h2.copyWith(color: Colors.black)),
            SizedBox(height: AppSpacing.lg),
            
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(Colors.lightGreen, 'Available'),
                _buildLegendItem(Colors.red.shade400, 'Booked'),
                _buildLegendItem(Colors.blue.shade500, 'Selected'),
              ],
            ),
            SizedBox(height: AppSpacing.xl),
            
            // Map Container
            Expanded(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 2.5,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // The Grid
                        SizedBox(
                          width: 250.w,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 8.w,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              final stallNumber = 101 + index;
                              final stallSize = getStallSize(stallNumber);
                              
                              final isLocked = stallSize != widget.selectedStallSize;
                              final isBooked = bookedStalls.contains(stallNumber);
                              final isSelected = selectedStall == stallNumber;

                              Color bgColor;
                              Color textColor = Colors.black87;

                              if (isLocked) {
                                bgColor = Colors.grey.shade300;
                                textColor = Colors.grey.shade500;
                              } else if (isBooked) {
                                bgColor = Colors.red.shade400;
                                textColor = Colors.white;
                              } else if (isSelected) {
                                bgColor = Colors.blue.shade500;
                                textColor = Colors.white;
                              } else {
                                bgColor = Colors.lightGreen;
                              }

                              return GestureDetector(
                                onTap: (isLocked || isBooked) ? null : () {
                                  HapticFeedback.lightImpact();
                                  setState(() {
                                    selectedStall = isSelected ? null : stallNumber;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.r),
                                    boxShadow: isSelected ? [
                                      BoxShadow(color: bgColor.withOpacity(0.5), blurRadius: 8, spreadRadius: 1)
                                    ] : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$stallNumber',
                                      style: AppTypography.bodySmall.copyWith(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        SizedBox(width: AppSpacing.md),
                        
                        // Entry / Exit Text
                        RotatedBox(
                          quarterTurns: 1, // Rotates text 90 degrees
                          child: Text(
                            'ENTRY // EXIT',
                            style: AppTypography.bodyLarge.copyWith(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Bottom Selection & Continue Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Stall', style: AppTypography.bodySmall.copyWith(color: Colors.black87, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4.h),
                    Text(
                      selectedStall != null ? '$selectedStall' : 'None', 
                      style: AppTypography.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.md),
              PremiumButton(
                text: 'Continue',
                onPressed: selectedStall == null ? () {} : () {
                  context.push('/payment_summary');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(width: 8.w),
        Text(label, style: AppTypography.bodyMedium.copyWith(color: Colors.black87, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
