import 'package:flutter/material.dart';

class AppColors {
  // Primary & Secondary
  static const Color primary = Color(0xFFFF2D75);
  static const Color secondary = Color(0xFF7C3AED);

  // Background & Surface
  static const Color background = Color(0xFF050816);
  static const Color surface = Color(0xFF111827);
  static const Color card = Color(0xFF1E293B);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color danger = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Stall Colors
  static const Color stallAvailable = success;
  static const Color stallBooked = danger;
  static const Color stallSelected = Color(0xFF3B82F6); // Blue
}
