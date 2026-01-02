import 'package:intl/intl.dart';

/// Date formatter utility
class DateFormatter {
  /// Format date to Indonesian format (e.g., 26 Des 2025)
  static String formatToIndonesian(DateTime date) {
    final formatter = DateFormat('d MMM yyyy', 'id_ID');
    return formatter.format(date);
  }

  /// Format date to short format (e.g., 26/12/2025)
  static String formatToShort(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  /// Format date to relative format (Today, Yesterday, or date)
  static String formatToRelative(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Hari ini';
    } else if (dateOnly == yesterday) {
      return 'Kemarin';
    } else if (dateOnly.isAfter(today.subtract(const Duration(days: 7)))) {
      final formatter = DateFormat('EEEE', 'id_ID');
      return formatter.format(date);
    } else {
      return formatToIndonesian(date);
    }
  }

  /// Format date with time (e.g., 26 Des 2025, 14:30)
  static String formatWithTime(DateTime date) {
    final formatter = DateFormat('d MMM yyyy, HH:mm', 'id_ID');
    return formatter.format(date);
  }

  /// Get month name in Indonesian
  static String getMonthName(int month) {
    const monthNames = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return monthNames[month - 1];
  }

  /// Get day name in Indonesian
  static String getDayName(DateTime date) {
    final formatter = DateFormat('EEEE', 'id_ID');
    return formatter.format(date);
  }
}
