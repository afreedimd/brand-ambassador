import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/custom_badge.dart';
import '../../../../shared/widgets/stat_card.dart';

class BrandDashboardPage extends StatefulWidget {
  const BrandDashboardPage({super.key});

  @override
  State<BrandDashboardPage> createState() => _BrandDashboardPageState();
}

class _BrandDashboardPageState extends State<BrandDashboardPage> {
  int _selectedIndex = 0;
  
  final List<Map<String, dynamic>> _stats = [
    {
      'label': 'In-Progress',
      'value': '12',
      'color': AppColors.warning,
      'icon': Icons.trending_up,
    },
    {
      'label': 'Under Negotiation',
      'value': '12',
      'color': AppColors.info,
      'icon': Icons.handshake,
    },
    {
      'label': 'Approved',
      'value': '234',
      'color': AppColors.success,
      'icon': Icons.check_circle,
    },
    {
      'label': 'Denied',
      'value': '35',
      'color': AppColors.error,
      'icon': Icons.cancel,
    },
    {
      'label': 'Campaign Drop',
      'value': '35',
      'color': AppColors.error,
      'icon': Icons.trending_down,
    },
  ];

  final List<Map<String, dynamic>> _campaigns = [
    {
      'id': '1',
      'name': 'FIND YOUR GREATNESS',
      'startDate': 'DEC 15, 2023',
      'endDate': 'JAN 08, 2024',
      'status': 'live',
    },
    {
      'id': '2',
      'name': 'MOVE MORE MOVE BETTER',
      'startDate': 'DEC 15, 2023',
      'endDate': 'JAN 08, 2024',
      'status': 'scheduled',
      'image': 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=400&h=300&fit=crop',
    },
    {
      'id': '3',
      'name': 'MOVE MORE MOVE',
      'startDate': 'DEC 15, 2023',
      'endDate': 'JAN 08, 2024',
      'status': 'draft',
      'image': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
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
            const Text('Brand Dashboard'),
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
                        label: 'Dashboard',
                        index: 0,
                      ),
                      _buildNavItem(
                        icon: Icons.people,
                        label: 'Community',
                        index: 1,
                      ),
                      _buildNavItem(
                        icon: Icons.edit,
                        label: 'Whiteboard',
                        index: 2,
                      ),
                      _buildNavItem(
                        icon: Icons.message,
                        label: 'Messages',
                        index: 3,
                        badge: '3',
                      ),
                      _buildNavItem(
                        icon: Icons.analytics,
                        label: 'Analytics & ROI',
                        index: 4,
                      ),
                      _buildNavItem(
                        icon: Icons.credit_card,
                        label: 'Credits & Billing',
                        index: 5,
                      ),
                      _buildNavItem(
                        icon: Icons.settings,
                        label: 'Settings',
                        index: 6,
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
    String? badge,
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
                if (badge != null)
                  CustomBadge(
                    text: badge,
                    variant: BadgeVariant.primary,
                    size: BadgeSize.small,
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
        return _buildDashboardContent();
      case 1:
        return _buildCommunityContent();
      case 2:
        return _buildWhiteboardContent();
      case 3:
        return _buildMessagesContent();
      case 4:
        return _buildAnalyticsContent();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Cards
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.2,
            ),
            itemCount: _stats.length,
            itemBuilder: (context, index) {
              final stat = _stats[index];
              return StatCard(
                title: stat['label'] as String,
                value: stat['value'] as String,
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
          
          // Ongoing Campaigns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ONGOING CAMPAIGN:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              CustomButton(
                text: 'Create Campaign',
                onPressed: () {
                  // TODO: Navigate to campaign creation
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Campaign Cards
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.5,
            ),
            itemCount: _campaigns.length,
            itemBuilder: (context, index) {
              final campaign = _campaigns[index];
              return CustomCard(
                onTap: () {
                  // TODO: Navigate to campaign details
                },
                isClickable: true,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    // Campaign Image
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: AppColors.cardGradient,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                          ),
                        ),
                        child: campaign['image'] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                                child: Image.network(
                                  campaign['image'] as String,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Text(
                                        campaign['name'] as String,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: AppColors.primaryText,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  campaign['name'] as String,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primaryText,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    ),
                    
                    // Campaign Info
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              campaign['name'] as String,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.primaryText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '${campaign['startDate'] as String} - ${campaign['endDate'] as String}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            StatusBadge(status: campaign['status'] as String),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityContent() {
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
              'Community Hub',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Real-time chat channels, DMs, and brand community spaces',
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

  Widget _buildWhiteboardContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Campaign Whiteboard',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Collaborative canvas for campaign planning',
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

  Widget _buildMessagesContent() {
    return Center(
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.message,
              size: 64.w,
              color: AppColors.placeholderColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Direct Messages',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Private conversations with influencers and team members',
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

  Widget _buildAnalyticsContent() {
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
              'Analytics & ROI Dashboard',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Post Affiliate Pro integration with real-time conversion tracking',
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
