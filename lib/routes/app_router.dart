import 'package:go_router/go_router.dart';

import '../features/welcome/screens/welcome_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/exhibition/screens/exhibition_details_screen.dart';
import '../features/booking/screens/booking_screen.dart';
import '../features/booking/screens/interactive_stall_screen.dart';
import '../features/payment/screens/payment_summary_screen.dart';
import '../features/payment/screens/payment_methods_screen.dart';
import '../features/payment/screens/payment_success_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/my_bookings_screen.dart';
import '../features/profile/screens/offers_coupons_screen.dart';
import '../features/profile/screens/edit_profile_screen.dart';
import '../features/admin/screens/admin_dashboard_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/auth/screens/otp_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/exhibition_details',
        builder: (context, state) => const ExhibitionDetailsScreen(),
      ),
      GoRoute(
        path: '/booking',
        builder: (context, state) => const BookingScreen(),
      ),
      GoRoute(
        path: '/interactive_stall',
        builder: (context, state) {
          final stallSize = state.extra as String? ?? '3m x 3m';
          return InteractiveStallScreen(selectedStallSize: stallSize);
        },
      ),
      GoRoute(
        path: '/payment_summary',
        builder: (context, state) => const PaymentSummaryScreen(),
      ),
      GoRoute(
        path: '/payment_methods',
        builder: (context, state) => const PaymentMethodsScreen(),
      ),
      GoRoute(
        path: '/payment_success',
        builder: (context, state) => const PaymentSuccessScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/my_bookings',
        builder: (context, state) => const MyBookingsScreen(),
      ),
      GoRoute(
        path: '/offers_coupons',
        builder: (context, state) => const OffersCouponsScreen(),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
    ],
  );
}
