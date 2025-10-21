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
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              '#',
                              style: TextStyle(
                                fontSize: 24,
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
                              fontSize: 32,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 16),
                    
                    Text(
                      'Choose a view to explore',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 48),
              
              // Demo Options Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final isTablet = screenWidth > 768;
                  final cardWidth = isTablet 
                    ? (screenWidth - 96) / 4  // 4 columns on tablet/desktop
                    : (screenWidth - 64) / 2; // 2 columns on mobile
                  
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
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
                          colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
                        ),
                        icon: Icons.business,
                        onTap: () => context.go('/brand-login'),
                        buttonColor: const Color(0xFF2563EB),
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
                          colors: [Color(0xFF9333EA), Color(0xFFDB2777)],
                        ),
                        icon: Icons.person,
                        onTap: () => context.go('/influencer-signup'),
                        buttonColor: const Color(0xFF9333EA),
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
                          colors: [Color(0xFF059669), Color(0xFF0D9488)],
                        ),
                        icon: Icons.dashboard,
                        onTap: () => context.go('/brand-dashboard'),
                        buttonColor: const Color(0xFF059669),
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
                          colors: [Color(0xFFEA580C), Color(0xFFDC2626)],
                        ),
                        icon: Icons.admin_panel_settings,
                        onTap: () => context.go('/super-admin-dashboard'),
                        buttonColor: const Color(0xFFEA580C),
                      ),
                    ],
                  );
                },
              ),
              
              SizedBox(height: 48),
              
              // Feature Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final isTablet = screenWidth > 768;
                  final cardWidth = isTablet 
                    ? (screenWidth - 96) / 4  // 4 columns on tablet/desktop
                    : (screenWidth - 64) / 2; // 2 columns on mobile
                  
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '🎥',
                        title: 'CMO Video Welcome',
                        color: const Color(0xFF60A5FA),
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '💬',
                        title: 'Agora Chat & DMs',
                        color: const Color(0xFFA78BFA),
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '📊',
                        title: 'Post Affiliate Pro',
                        color: const Color(0xFF34D399),
                      ),
                      _buildFeatureCard(
                        context: context,
                        width: cardWidth,
                        emoji: '🎨',
                        title: 'Whiteboard Collab',
                        color: const Color(0xFFFB923C),
                      ),
                    ],
                  );
                },
              ),
              
              SizedBox(height: 64),
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
    required Color buttonColor,
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
              height: 120,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 64,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            
            SizedBox(height: 32),
            
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 24),
            
            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryText,
              ),
            ),
            
            SizedBox(height: 24),
            
            // Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'View $title',
                onPressed: onTap,
                variant: ButtonVariant.primary,
                isFullWidth: true,
                backgroundColor: buttonColor,
                textColor: AppColors.primaryText,
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
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
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
