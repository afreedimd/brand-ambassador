import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/demo_switcher/presentation/pages/demo_switcher_page.dart';
import '../../features/auth/presentation/pages/brand_login_page.dart';
import '../../features/auth/presentation/pages/influencer_signup_page.dart';
import '../../features/dashboard/presentation/pages/brand_dashboard_page.dart';
import '../../features/dashboard/presentation/pages/super_admin_dashboard_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/demo-switcher',
        name: 'demo-switcher',
        builder: (context, state) => const DemoSwitcherPage(),
      ),
      GoRoute(
        path: '/brand-login',
        name: 'brand-login',
        builder: (context, state) => const BrandLoginPage(),
      ),
      GoRoute(
        path: '/influencer-signup',
        name: 'influencer-signup',
        builder: (context, state) => const InfluencerSignupPage(),
      ),
      GoRoute(
        path: '/brand-dashboard',
        name: 'brand-dashboard',
        builder: (context, state) => const BrandDashboardPage(),
      ),
      GoRoute(
        path: '/super-admin-dashboard',
        name: 'super-admin-dashboard',
        builder: (context, state) => const SuperAdminDashboardPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}
