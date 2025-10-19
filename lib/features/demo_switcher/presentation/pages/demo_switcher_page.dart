import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_card.dart';

class DemoSwitcherPage extends StatelessWidget {
  const DemoSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    
                    // Logo and Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.accentBlue, Color(0xFF8B5CF6)],
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              '#',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryText,
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(width: 4.w),
                        
                        Flexible(
                          child: Text(
                            'Brand Ambassador Platform',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 12.h),
                    
                    Text(
                      'Choose a view to explore',
                      style: TextStyle(
                        fontSize: 6.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 24.h),
              
              // Demo Options Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final isTablet = screenWidth > 768;
                  final cardWidth = isTablet 
                    ? (screenWidth - 72.w) / 4  // 4 columns on tablet/desktop
                    : (screenWidth - 48.w) / 2; // 2 columns on mobile
                  
                  return Wrap(
                    spacing: 16.w,
                    runSpacing: 16.h,
                    alignment: WrapAlignment.center,
                    children: [
                      // Brand Login Card
                      _buildDemoCard(
                        context: context,
                        width: cardWidth,
                        title: 'Brand Login',
                        description: 'Login portal for brands to access their ambassador dashboard and manage campaigns',
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.accentBlue, Color(0xFF8B5CF6)],
                        ),
                        icon: Icons.business,
                        onTap: () => context.go('/brand-login'),
                      ),
                      
                      // Influencer Signup Card
                      _buildDemoCard(
                        context: context,
                        width: cardWidth,
                        title: 'Influencer Signup',
                        description: 'Co-branded signup page with CMO welcome video for influencer applications',
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                        ),
                        icon: Icons.person,
                        onTap: () => context.go('/influencer-signup'),
                      ),
                      
                      // Brand Dashboard Card
                      _buildDemoCard(
                        context: context,
                        width: cardWidth,
                        title: 'Brand Dashboard',
                        description: 'Main dashboard with campaigns, influencer management, and analytics',
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                        ),
                        icon: Icons.dashboard,
                        onTap: () => context.go('/brand-dashboard'),
                      ),
                      
                      // Super Admin Card
                      _buildDemoCard(
                        context: context,
                        width: cardWidth,
                        title: 'Super Admin',
                        description: 'Platform control center with SaaS metrics, revenue, and user management',
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
                        ),
                        icon: Icons.admin_panel_settings,
                        onTap: () => context.go('/super-admin-dashboard'),
                      ),
                    ],
                  );
                },
              ),
              
              SizedBox(height: 24.h),
              
              // Feature Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final isTablet = screenWidth > 768;
                  final cardWidth = isTablet 
                    ? (screenWidth - 80.w) / 4  // 4 columns on tablet/desktop
                    : (screenWidth - 48.w) / 2; // 2 columns on mobile
                  
                  return Wrap(
                    spacing: 16.w,
                    runSpacing: 16.h,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '🎥',
                        title: 'CMO Video Welcome',
                        color: AppColors.accentBlue,
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '💬',
                        title: 'Agora Chat & DMs',
                        color: Color(0xFF8B5CF6),
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '📊',
                        title: 'Post Affiliate Pro',
                        color: Color(0xFF10B981),
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '🎨',
                        title: 'Whiteboard Collab',
                        color: Color(0xFFF59E0B),
                      ),
                    ],
                  );
                },
              ),
              
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemoCard({
    required BuildContext context,
    required double width,
    required String title,
    required String description,
    required LinearGradient gradient,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: width,
      child: CustomCard(
        onTap: onTap,
        isClickable: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient Icon Container
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20.w,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 8.sp,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            SizedBox(height: 6.h),
            
            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 6.sp,
                color: AppColors.secondaryText,
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'View $title',
                onPressed: onTap,
                variant: ButtonVariant.primary,
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required double width,
    required String emoji,
    required String title,
    required Color color,
  }) {
    return Container(
      width: width,
      child: CustomCard(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: 8.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 6.sp,
                  color: AppColors.secondaryText,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
