import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/custom_badge.dart';
import '../../../../shared/widgets/stat_card.dart';

class SuperAdminDashboardPage extends StatefulWidget {
  const SuperAdminDashboardPage({super.key});

  @override
  State<SuperAdminDashboardPage> createState() => _SuperAdminDashboardPageState();
}

class _SuperAdminDashboardPageState extends State<SuperAdminDashboardPage> {
  int _selectedIndex = 0;
  
  final List<Map<String, dynamic>> _platformStats = [
    {
      'label': 'Total Brands',
      'value': '1,247',
      'color': AppColors.accentBlue,
      'icon': Icons.business,
      'change': '+12%',
    },
    {
      'label': 'Active Influencers',
      'value': '15,892',
      'color': AppColors.success,
      'icon': Icons.people,
      'change': '+8%',
    },
    {
      'label': 'Live Campaigns',
      'value': '3,456',
      'color': AppColors.warning,
      'icon': Icons.campaign,
      'change': '+23%',
    },
    {
      'label': 'Total Revenue',
      'value': '\$2.4M',
      'color': AppColors.success,
      'icon': Icons.attach_money,
      'change': '+15%',
    },
  ];

  final List<Map<String, dynamic>> _recentActivities = [
    {
      'type': 'brand_signup',
      'title': 'New Brand Registration',
      'description': 'Nike joined the platform',
      'time': '2 minutes ago',
      'icon': Icons.business,
      'color': AppColors.accentBlue,
    },
    {
      'type': 'campaign_created',
      'title': 'Campaign Created',
      'description': 'Adidas launched "Impossible is Nothing"',
      'time': '15 minutes ago',
      'icon': Icons.campaign,
      'color': AppColors.success,
    },
    {
      'type': 'influencer_approved',
      'title': 'Influencer Approved',
      'description': 'Sarah Johnson (500K followers) approved',
      'time': '1 hour ago',
      'icon': Icons.person_add,
      'color': AppColors.success,
    },
    {
      'type': 'payment_processed',
      'title': 'Payment Processed',
      'description': '\$50,000 payout to influencers',
      'time': '2 hours ago',
      'icon': Icons.payment,
      'color': AppColors.warning,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  '#',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            const Text('Super Admin Dashboard'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/demo-switcher'),
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250.w,
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              border: Border(
                right: BorderSide(color: AppColors.borderColor),
              ),
            ),
            child: Column(
              children: [
                // Navigation Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.w),
                    children: [
                      _buildNavItem(
                        icon: Icons.dashboard,
                        label: 'Overview',
                        index: 0,
                      ),
                      _buildNavItem(
                        icon: Icons.business,
                        label: 'Brand Management',
                        index: 1,
                      ),
                      _buildNavItem(
                        icon: Icons.people,
                        label: 'Influencer Management',
                        index: 2,
                      ),
                      _buildNavItem(
                        icon: Icons.campaign,
                        label: 'Campaign Oversight',
                        index: 3,
                      ),
                      _buildNavItem(
                        icon: Icons.analytics,
                        label: 'Platform Analytics',
                        index: 4,
                      ),
                      _buildNavItem(
                        icon: Icons.payment,
                        label: 'Financial Overview',
                        index: 5,
                      ),
                      _buildNavItem(
                        icon: Icons.security,
                        label: 'Security & Compliance',
                        index: 6,
                      ),
                      _buildNavItem(
                        icon: Icons.settings,
                        label: 'System Settings',
                        index: 7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      child: Material(
        color: isSelected ? AppColors.hoverColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: () => setState(() => _selectedIndex = index),
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected ? AppColors.primaryText : AppColors.secondaryText,
                  size: 20.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected ? AppColors.primaryText : AppColors.secondaryText,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildOverviewContent();
      case 1:
        return _buildBrandManagementContent();
      case 2:
        return _buildInfluencerManagementContent();
      case 3:
        return _buildCampaignOversightContent();
      case 4:
        return _buildPlatformAnalyticsContent();
      case 5:
        return _buildFinancialOverviewContent();
      case 6:
        return _buildSecurityContent();
      case 7:
        return _buildSystemSettingsContent();
      default:
        return _buildOverviewContent();
    }
  }

  Widget _buildOverviewContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Platform Stats
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.5,
            ),
            itemCount: _platformStats.length,
            itemBuilder: (context, index) {
              final stat = _platformStats[index];
              return StatCard(
                title: stat['label'] as String,
                value: stat['value'] as String,
                subtitle: stat['change'] as String,
                valueColor: stat['color'] as Color,
                icon: Icon(
                  stat['icon'] as IconData,
                  color: stat['color'] as Color,
                  size: 24.w,
                ),
              );
            },
          ),
          
          SizedBox(height: 32.h),
          
          // Recent Activities
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activities',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              CustomButton(
                text: 'View All',
                variant: ButtonVariant.outline,
                onPressed: () {
                  // TODO: Navigate to full activity log
                },
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Activity List
          CustomCard(
            child: Column(
              children: _recentActivities.map((activity) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.borderColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: (activity['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          activity['icon'] as IconData,
                          color: activity['color'] as Color,
                          size: 20.w,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity['title'] as String,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.primaryText,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              activity['description'] as String,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        activity['time'] as String,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.placeholderColor,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandManagementContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.business,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Brand Management',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Manage all brands on the platform',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfluencerManagementContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Influencer Management',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Oversee influencer verification and management',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignOversightContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.campaign,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Campaign Oversight',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Monitor all campaigns across the platform',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformAnalyticsContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.analytics,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Platform Analytics',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Comprehensive platform performance metrics',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialOverviewContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.payment,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Financial Overview',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Platform revenue and financial metrics',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.security,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Security & Compliance',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Platform security and compliance monitoring',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemSettingsContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.settings,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'System Settings',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Configure platform settings and preferences',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
