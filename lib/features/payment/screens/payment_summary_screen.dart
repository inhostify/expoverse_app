import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class PaymentSummaryScreen extends StatefulWidget {
  const PaymentSummaryScreen({super.key});

  @override
  State<PaymentSummaryScreen> createState() => _PaymentSummaryScreenState();
}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  final _nameController = TextEditingController(text: 'Rahul Sharma');
  final _emailController = TextEditingController(text: 'rahulsharma@email.com');
  final _phoneController = TextEditingController(text: '+91 98765 43210');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text('India Trade Fair 2025', style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
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
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(AppSpacing.lg),
                children: [
                  // --- Price Summary ---
                  _buildPriceRow('Stall No.', '113'),
                  SizedBox(height: AppSpacing.sm),
                  _buildPriceRow('Price', '₹ 25,000'),
                  SizedBox(height: AppSpacing.sm),
                  _buildPriceRow('GST (18%)', '₹ 4,500'),
                  SizedBox(height: AppSpacing.md),
                  Divider(color: Colors.grey.shade200),
                  SizedBox(height: AppSpacing.sm),
                  _buildPriceRow('Total Amount', '₹ 29,500', isBold: true),
                  SizedBox(height: AppSpacing.lg),

                  // --- Coupon ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coupon Code', style: AppTypography.bodyMedium.copyWith(color: Colors.black87)),
                      InkWell(
                        onTap: () {},
                        child: Text('Apply', style: AppTypography.bodyMedium.copyWith(color: Colors.blue.shade600, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  Divider(color: Colors.grey.shade200),
                  SizedBox(height: AppSpacing.md),

                  // --- Cancellation ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cancellation', style: AppTypography.bodyMedium.copyWith(color: Colors.black87)),
                      Text('Free cancellation before 7 days', style: AppTypography.bodySmall.copyWith(color: Colors.grey.shade600)),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // --- Customer Details ---
                  Text('Customer Details', style: AppTypography.h3.copyWith(color: Colors.black)),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(_nameController, TextInputType.name),
                        _buildTextField(_emailController, TextInputType.emailAddress),
                        _buildTextField(_phoneController, TextInputType.phone),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // --- Payment Methods ---
                  Text('Payment Methods', style: AppTypography.h3.copyWith(color: Colors.black)),
                  SizedBox(height: AppSpacing.sm),
                  GestureDetector(
                    onTap: () {
                      context.push('/payment_methods');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPaymentMethodIcon(Icons.account_balance_wallet_outlined, 'UPI', Colors.green),
                        _buildPaymentMethodIcon(Icons.credit_card_outlined, 'Card', Colors.blue),
                        _buildPaymentMethodIcon(Icons.account_balance_outlined, 'Net Banking', Colors.indigo),
                        _buildPaymentMethodIcon(Icons.wallet_outlined, 'Wallet', Colors.purple),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
            
            // Bottom Button
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: SafeArea(
                child: PremiumButton(
                  text: 'Proceed to Pay',
                  onPressed: () {
                    context.push('/payment_methods');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label, 
          style: isBold 
              ? AppTypography.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.bold)
              : AppTypography.bodyMedium.copyWith(color: Colors.black54)
        ),
        Text(
          value, 
          style: isBold 
              ? AppTypography.h3.copyWith(color: Colors.black)
              : AppTypography.bodyMedium.copyWith(color: Colors.black87, fontWeight: FontWeight.bold)
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, TextInputType keyboardType) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppTypography.bodyMedium.copyWith(color: Colors.black87),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6.h),
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildPaymentMethodIcon(IconData icon, String label, Color iconColor) {
    return Container(
      width: 75.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28.sp),
          SizedBox(height: 8.h),
          Text(label, style: AppTypography.bodySmall.copyWith(color: Colors.black87, fontSize: 10.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
