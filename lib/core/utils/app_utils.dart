import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  // Date Formatting
  static String formatDate(DateTime date, {String pattern = 'MMM dd, yyyy'}) {
    return DateFormat(pattern).format(date);
  }
  
  static String formatDateTime(DateTime dateTime, {String pattern = 'MMM dd, yyyy HH:mm'}) {
    return DateFormat(pattern).format(dateTime);
  }
  
  static String formatTime(DateTime time, {String pattern = 'HH:mm'}) {
    return DateFormat(pattern).format(time);
  }
  
  // Number Formatting
  static String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
  
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }
  
  static String formatPercentage(double percentage) {
    return '${percentage.toStringAsFixed(1)}%';
  }
  
  // String Utils
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
  
  // Validation
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  static bool isValidPassword(String password) {
    return password.length >= 8 && 
           password.contains(RegExp(r'[A-Z]')) && 
           password.contains(RegExp(r'[a-z]')) && 
           password.contains(RegExp(r'[0-9]'));
  }
  
  // Clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
  
  // URL Launcher
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
  
  // Device Info
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }
  
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
  
  // Animation Helpers
  static Duration getAnimationDuration(AnimationType type) {
    switch (type) {
      case AnimationType.short:
        return const Duration(milliseconds: 200);
      case AnimationType.medium:
        return const Duration(milliseconds: 300);
      case AnimationType.long:
        return const Duration(milliseconds: 500);
    }
  }
  
  // Color Helpers
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'approved':
        return Colors.green;
      case 'denied':
        return Colors.red;
      case 'live':
        return Colors.green;
      case 'paused':
        return Colors.orange;
      case 'ended':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
  
  // File Helpers
  static String getFileExtension(String fileName) {
    return fileName.split('.').last.toLowerCase();
  }
  
  static String getFileSizeString(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
  
  // Debounce
  static void debounce(VoidCallback callback, {Duration delay = const Duration(milliseconds: 300)}) {
    Future.delayed(delay, callback);
  }
}

enum AnimationType { short, medium, long }
