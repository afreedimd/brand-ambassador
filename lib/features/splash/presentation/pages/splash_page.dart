import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToNextScreen(); // Commented out navigation from launch screen
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/demo-switcher');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentBlue.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '#',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 16.h),
                    
                    // App Name
                    Text(
                      'Brand Ambassador',
                      style: TextStyle(
                        fontSize: 32,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    SizedBox(height: 4.h),
                    
                    // Tagline
                    Text(
                      'Manage, Market, Measure, Monetize & Mint',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.secondaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Loading Indicator
                    const LoadingWidget(
                      message: 'Initializing...',
                      size: 12,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
