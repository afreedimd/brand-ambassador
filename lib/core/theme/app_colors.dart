import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBackground = Color(0xFF151515);
  static const Color cardBackground = Color(0xFF292929);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFF6F6F6);
  static const Color accentBlue = Color(0xFF3B82F6);
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Campaign Status Colors
  static const Color campaignDraft = Color(0xFF6B7280);
  static const Color campaignScheduled = Color(0xFF3B82F6);
  static const Color campaignLive = Color(0xFF10B981);
  static const Color campaignPaused = Color(0xFFF59E0B);
  static const Color campaignEnded = Color(0xFFEF4444);
  
  // Influencer Status Colors
  static const Color influencerPending = Color(0xFF6B7280);
  static const Color influencerApproved = Color(0xFF10B981);
  static const Color influencerDenied = Color(0xFFEF4444);
  static const Color influencerEmbargo = Color(0xFFF59E0B);
  static const Color influencerSuspended = Color(0xFFEF4444);
  static const Color influencerBlocked = Color(0xFF6B7280);
  
  // Tier Colors
  static const Color tierStarter = Color(0xFF6B7280);
  static const Color tierGrowth = Color(0xFF3B82F6);
  static const Color tierProfessional = Color(0xFF8B5CF6);
  static const Color tierEnterprise = Color(0xFFF59E0B);
  
  // UI Colors
  static const Color borderColor = Color(0xFF3A3A3A);
  static const Color hoverColor = Color(0xFF1F1F1F);
  static const Color disabledColor = Color(0xFF4B5563);
  static const Color placeholderColor = Color(0xFF9CA3AF);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF9333EA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF292929), Color(0xFF1F1F1F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Social Media Colors
  static const Color instagram = Color(0xFFE4405F);
  static const Color tiktok = Color(0xFF000000);
  static const Color youtube = Color(0xFFFF0000);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color facebook = Color(0xFF1877F2);
  static const Color linkedin = Color(0xFF0A66C2);
}
