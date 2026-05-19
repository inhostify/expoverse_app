import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';

class OffersCouponsScreen extends StatelessWidget {
  const OffersCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151821),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text('Offers & Coupons', style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.lg),
        children: [
          _buildCouponCard(
            code: 'FLAT20',
            description: 'Get 20% OFF on all bookings',
            validTill: '31 May 2025',
          ),
          SizedBox(height: AppSpacing.md),
          _buildCouponCard(
            code: 'EXTRA10',
            description: 'Get extra 10% OFF',
            validTill: '15 May 2025',
          ),
          SizedBox(height: AppSpacing.md),
          _buildCouponCard(
            code: 'WELCOME5',
            description: 'Flat ₹500 OFF on first booking',
            validTill: 'No expiry',
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard({
    required String code,
    required String description,
    required String validTill,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(code, style: AppTypography.h2.copyWith(color: Colors.black)),
              SizedBox(height: 8.h),
              Text(description, style: AppTypography.bodyMedium.copyWith(color: Colors.grey.shade700)),
              SizedBox(height: 8.h),
              Text('Use Code: $code', style: AppTypography.bodyMedium.copyWith(color: Colors.grey.shade700)),
              SizedBox(height: 8.h),
              Text('Valid Till: $validTill', style: AppTypography.bodySmall.copyWith(color: Colors.grey.shade500)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.pink.shade500,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text('Apply', style: AppTypography.bodyMedium.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
