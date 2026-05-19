import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Node.js API में डेटा भेजने का फंक्शन
  Future<void> _handleSignup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('कृपया सभी फ़ील्ड भरें!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final dio = Dio();
      
      // Node.js सर्वर की POST API का कॉल
      final response = await dio.post(
        'https://inhostify.com/exp/api/save',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          // यदि आवश्यक हो तो आप सर्वर पर पासवर्ड भी भेज सकते हैं
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['message'] ?? 'साइनअप सफल रहा!'),
              backgroundColor: Colors.green,
            ),
          );
          // सफलतापूर्वक डेटाबेस में सेव होने के बाद OTP स्क्रीन पर जाएँ
          context.push('/otp');
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['message'] ?? 'साइनअप फेल हो गया!'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'नेटवर्क या सर्वर एरर! कृपया बाद में प्रयास करें।';
        if (e is DioException) {
          if (e.response?.statusCode == 500) {
            errorMessage = 'सर्वर में तकनीकी खराबी (500 Error)। कृपया अपनी डिटेल्स जांचें या बाद में प्रयास करें।';
          } else if (e.response?.data != null && e.response?.data['message'] != null) {
            errorMessage = e.response!.data['message'].toString();
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: AppTypography.h1),
              SizedBox(height: AppSpacing.xs),
              Text('Join ExpoVerse to book premium stalls', style: AppTypography.bodyMedium),
              
              SizedBox(height: 40.h),
              
              // Name Field
              Text('Full Name', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.person_outline, 'Enter your full name', _nameController),
              
              SizedBox(height: AppSpacing.md),
              
              // Email Field
              Text('Email Address', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.email_outlined, 'Enter your email', _emailController),
              
              SizedBox(height: AppSpacing.md),
              
              // Phone Field
              Text('Phone Number', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.phone_outlined, 'Enter your phone number', _phoneController),
              
              SizedBox(height: AppSpacing.md),
              
              // Password Field
              Text('Password', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.lock_outline, 'Create a password', _passwordController, isPassword: true),
              
              SizedBox(height: AppSpacing.xl),
              
              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                  : PremiumButton(
                      text: 'Sign Up',
                      onPressed: _handleSignup,
                    ),
              
              SizedBox(height: AppSpacing.xl),
              
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: AppTypography.bodyMedium),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      'Sign In',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: AppTypography.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
          prefixIcon: Icon(icon, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 16.h),
        ),
      ),
    );
  }
}
