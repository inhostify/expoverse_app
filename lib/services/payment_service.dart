import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

class PaymentService {
  late Razorpay _razorpay;

  PaymentService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(double amount, String contact, String email) {
    var options = {
      'key': 'rzp_test_YOUR_KEY_HERE', // Replace with Real Key
      'amount': amount * 100, // in paise
      'name': 'ExpoVerse',
      'description': 'Stall Booking Payment',
      'prefill': {
        'contact': contact,
        'email': email,
      },
      'theme': {
        'color': '#FF2D75' // Primary Color
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Navigate to success screen & Update Backend Status to 'Booked'
    debugPrint("SUCCESS: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Show error toast & Release Temporary Hold if needed
    debugPrint("ERROR: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("EXTERNAL_WALLET: ${response.walletName}");
  }

  void dispose() {
    _razorpay.clear();
  }
}
