import 'package:flutter/material.dart';

/// Color palette for uangku app
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2ECC71); // Emerald Green
  static const Color primaryLight = Color(0xFF58D68D);
  static const Color primaryDark = Color(0xFF27AE60);
  
  // Secondary Colors
  static const Color secondary = Color(0xFFF5F6FA);
  static const Color secondaryDark = Color(0xFFDCDDE1);
  
  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color cardBackground = Colors.white;
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textLight = Color(0xFFBDC3C7);
  
  // Income & Expense
  static const Color income = Color(0xFF2ECC71);
  static const Color expense = Color(0xFFE74C3C);
  
  // Accent Colors
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient balanceCardGradient = LinearGradient(
    colors: [Color(0xFF2ECC71), Color(0xFF58D68D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient loginGradient = LinearGradient(
    colors: [Color(0xFF2ECC71), Color(0xFF3498DB)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
