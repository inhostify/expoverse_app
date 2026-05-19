class ApiConstants {
  // Base URL provided by user
  static const String baseUrl = 'https://inhostify.com/esb/api/';

  // Auth Endpoints
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String verifyOtp = 'auth/verify-otp';
  static const String forgotPassword = 'auth/forgot-password';

  // Exhibitions
  static const String getExhibitions = 'exhibitions';
  static const String getExhibitionDetails = 'exhibitions/'; // append id

  // Stalls
  static const String getStallLayout = 'stalls/layout/'; // append exhibition_id
  static const String holdStall = 'stalls/hold'; // POST {stall_id, user_id}
  
  // Bookings
  static const String createBooking = 'bookings/create';
  static const String verifyPayment = 'bookings/verify-payment';
  
  // Profile
  static const String getUserProfile = 'profile';
  static const String updateProfile = 'profile/update';
  static const String getMyBookings = 'profile/bookings';
}
