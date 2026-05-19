import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Admin Dashboard', style: AppTypography.h3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview', style: AppTypography.h2),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(child: _buildStatCard('Total Revenue', '₹5.2L', Icons.account_balance_wallet, AppColors.success)),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: _buildStatCard('Active Events', '12', Icons.event, AppColors.primary)),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(child: _buildStatCard('Stalls Booked', '156', Icons.storefront, AppColors.warning)),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: _buildStatCard('Total Users', '2.4K', Icons.people, AppColors.secondary)),
              ],
            ),
            SizedBox(height: AppSpacing.xl),

            Text('Management', style: AppTypography.h2),
            SizedBox(height: AppSpacing.sm),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildActionCard('Exhibitions', Icons.confirmation_number),
                _buildActionCard('Stalls', Icons.grid_view),
                _buildActionCard('Users', Icons.person_search),
                _buildActionCard('Coupons', Icons.local_offer),
                _buildActionCard('Payments', Icons.payment),
                _buildActionCard('Reports', Icons.bar_chart),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20.sp),
              SizedBox(width: AppSpacing.sm),
              Expanded(child: Text(title, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary))),
            ],
          ),
          SizedBox(height: AppSpacing.md),
          Text(value, style: AppTypography.h2),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: Colors.white10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primary, size: 32.sp),
              SizedBox(height: AppSpacing.sm),
              Text(title, style: AppTypography.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
