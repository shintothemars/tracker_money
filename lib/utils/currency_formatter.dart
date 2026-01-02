import 'package:intl/intl.dart';

/// Currency formatter utility
class CurrencyFormatter {
  /// Format amount to Indonesian Rupiah
  static String formatToIDR(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  /// Format amount to compact format (e.g., 1.5K, 2.3M)
  static String formatToCompact(double amount) {
    if (amount >= 1000000000) {
      return 'Rp ${(amount / 1000000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000000) {
      return 'Rp ${(amount / 1000000).toStringAsFixed(1)}Jt';
    } else if (amount >= 1000) {
      return 'Rp ${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return 'Rp ${amount.toStringAsFixed(0)}';
    }
  }

  /// Parse formatted currency string to double
  static double parseFromIDR(String formattedAmount) {
    final cleanedAmount = formattedAmount
        .replaceAll('Rp', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .trim();
    return double.tryParse(cleanedAmount) ?? 0.0;
  }
}
