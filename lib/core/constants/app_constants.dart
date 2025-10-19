class AppConstants {
  // App Information
  static const String appName = 'Brand Ambassador';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.brandambassador.com';
  static const String apiVersion = '/v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // File Upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> allowedDocumentTypes = ['pdf', 'doc', 'docx'];
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 50;
  
  // Campaign Status
  static const String campaignStatusDraft = 'draft';
  static const String campaignStatusScheduled = 'scheduled';
  static const String campaignStatusLive = 'live';
  static const String campaignStatusPaused = 'paused';
  static const String campaignStatusEnded = 'ended';
  
  // Influencer Status
  static const String influencerStatusPending = 'pending';
  static const String influencerStatusApproved = 'approved';
  static const String influencerStatusDenied = 'denied';
  static const String influencerStatusEmbargo = 'embargo';
  static const String influencerStatusSuspended = 'suspended';
  static const String influencerStatusBlocked = 'blocked';
  
  // User Roles
  static const String userRoleBrand = 'brand';
  static const String userRoleInfluencer = 'influencer';
  static const String userRoleSuperAdmin = 'super_admin';
  
  // Tier Levels
  static const String tierStarter = 'starter';
  static const String tierGrowth = 'growth';
  static const String tierProfessional = 'professional';
  static const String tierEnterprise = 'enterprise';
}
