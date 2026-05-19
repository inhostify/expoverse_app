import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String _selectedMethod = 'UPI';

  final List<Map<String, dynamic>> _paymentMethods = [
    {'title': 'UPI', 'icon': Icons.account_balance_wallet_outlined},
    {'title': 'Credit / Debit Card', 'icon': Icons.credit_card_outlined},
    {'title': 'Net Banking', 'icon': Icons.account_balance_outlined},
    {'title': 'Wallet', 'icon': Icons.wallet_outlined},
  ];

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
        title: Text('Select Payment Method', style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: AppSpacing.sm),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xl),
                itemCount: _paymentMethods.length,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Divider(color: Colors.grey.shade200),
                ),
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  final isSelected = _selectedMethod == method['title'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMethod = method['title'];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      color: Colors.transparent, // Ensures entire row is clickable
                      child: Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.red.shade400 : Colors.grey.shade400,
                                width: isSelected ? 6 : 2,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSpacing.md),
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(method['icon'], color: Colors.black87, size: 20.sp),
                          ),
                          SizedBox(width: AppSpacing.md),
                          Text(
                            method['title'],
                            style: AppTypography.bodyMedium.copyWith(
                              color: Colors.black87,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Price Details & Button
            Container(
              padding: EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price Details', style: AppTypography.h3.copyWith(color: Colors.black)),
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount', style: AppTypography.bodyMedium.copyWith(color: Colors.black87)),
                        Text('₹ 29,500', style: AppTypography.h3.copyWith(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: AppSpacing.xl),
                    PremiumButton(
                      text: 'Pay ₹ 29,500',
                      onPressed: () {
                        context.push('/payment_success');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
