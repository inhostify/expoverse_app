import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../../../design_system/spacing.dart';
import '../../../shared/widgets/premium_button.dart';

import '../../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _authService.login(email, password);

    setState(() {
      _isLoading = false;
    });

    if (result['success']) {
      if (mounted) context.go('/home');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              // App Logo Mini
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(Icons.event_seat, color: Colors.white, size: 30.sp),
              ),
              SizedBox(height: AppSpacing.lg),
              
              Text('Welcome Back!', style: AppTypography.h1),
              SizedBox(height: AppSpacing.xs),
              Text('Sign in to continue to ExpoVerse', style: AppTypography.bodyMedium),
              
              SizedBox(height: 40.h),
              
              // Email Field
              Text('Email Address', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.email_outlined, 'Enter your email', _emailController),
              
              SizedBox(height: AppSpacing.md),
              
              // Password Field
              Text('Password', style: AppTypography.bodySmall),
              SizedBox(height: AppSpacing.xs),
              _buildTextField(Icons.lock_outline, 'Enter your password', _passwordController, isPassword: true),
              
              SizedBox(height: AppSpacing.md),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
              
              SizedBox(height: AppSpacing.lg),
              
              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                  : PremiumButton(
                      text: 'Sign In',
                      onPressed: _handleLogin,
                    ),
              
              SizedBox(height: AppSpacing.xl),
              
              // Social Login
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Text('OR', style: AppTypography.bodySmall),
                  ),
                  const Expanded(child: Divider(color: Colors.white24)),
                ],
              ),
              
              SizedBox(height: AppSpacing.xl),
              
              // Google Button
              PremiumButton(
                text: 'Continue with Google',
                onPressed: () {},
                isOutline: true,
              ),
              
              SizedBox(height: 40.h),
              
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTypography.bodyMedium),
                  GestureDetector(
                    onTap: () => context.push('/signup'),
                    child: Text(
                      'Sign Up',
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
