import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

enum BadgeVariant {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
}

enum BadgeSize {
  small,
  medium,
  large,
}

class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;
  final BadgeSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final bool isRounded;

  const CustomBadge({
    super.key,
    required this.text,
    this.variant = BadgeVariant.primary,
    this.size = BadgeSize.medium,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.isRounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(isRounded ? _getBorderRadius() : 4.r),
        border: _getBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(width: 4.w),
          ],
          Text(
            text,
            style: _getTextStyle(),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (variant) {
      case BadgeVariant.primary:
        return AppColors.accentBlue;
      case BadgeVariant.secondary:
        return AppColors.cardBackground;
      case BadgeVariant.success:
        return AppColors.success;
      case BadgeVariant.warning:
        return AppColors.warning;
      case BadgeVariant.error:
        return AppColors.error;
      case BadgeVariant.info:
        return AppColors.info;
    }
  }

  Color _getTextColor() {
    if (textColor != null) return textColor!;
    
    switch (variant) {
      case BadgeVariant.primary:
        return AppColors.primaryText;
      case BadgeVariant.secondary:
        return AppColors.secondaryText;
      case BadgeVariant.success:
        return AppColors.primaryText;
      case BadgeVariant.warning:
        return AppColors.primaryText;
      case BadgeVariant.error:
        return AppColors.primaryText;
      case BadgeVariant.info:
        return AppColors.primaryText;
    }
  }

  Border? _getBorder() {
    switch (variant) {
      case BadgeVariant.secondary:
        return Border.all(color: AppColors.borderColor);
      default:
        return null;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BadgeSize.small:
        return EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h);
      case BadgeSize.medium:
        return EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h);
      case BadgeSize.large:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case BadgeSize.small:
        return 4.r;
      case BadgeSize.medium:
        return 6.r;
      case BadgeSize.large:
        return 8.r;
    }
  }

  TextStyle _getTextStyle() {
    final color = _getTextColor();
    
    switch (size) {
      case BadgeSize.small:
        return TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: color,
        );
      case BadgeSize.medium:
        return TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: color,
        );
      case BadgeSize.large:
        return TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: color,
        );
    }
  }
}

class StatusBadge extends StatelessWidget {
  final String status;
  final BadgeSize size;

  const StatusBadge({
    super.key,
    required this.status,
    this.size = BadgeSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final (variant, text) = _getStatusConfig(status);
    
    return CustomBadge(
      text: text,
      variant: variant,
      size: size,
    );
  }

  (BadgeVariant, String) _getStatusConfig(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return (BadgeVariant.warning, 'PENDING');
      case 'approved':
        return (BadgeVariant.success, 'APPROVED');
      case 'denied':
        return (BadgeVariant.error, 'DENIED');
      case 'embargo':
        return (BadgeVariant.warning, 'EMBARGO');
      case 'suspended':
        return (BadgeVariant.error, 'SUSPENDED');
      case 'blocked':
        return (BadgeVariant.error, 'BLOCKED');
      case 'draft':
        return (BadgeVariant.secondary, 'DRAFT');
      case 'scheduled':
        return (BadgeVariant.info, 'SCHEDULED');
      case 'live':
        return (BadgeVariant.success, 'LIVE');
      case 'paused':
        return (BadgeVariant.warning, 'PAUSED');
      case 'ended':
        return (BadgeVariant.secondary, 'ENDED');
      default:
        return (BadgeVariant.secondary, status.toUpperCase());
    }
  }
}

class TierBadge extends StatelessWidget {
  final String tier;
  final BadgeSize size;

  const TierBadge({
    super.key,
    required this.tier,
    this.size = BadgeSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final (variant, text) = _getTierConfig(tier);
    
    return CustomBadge(
      text: text,
      variant: variant,
      size: size,
    );
  }

  (BadgeVariant, String) _getTierConfig(String tier) {
    switch (tier.toLowerCase()) {
      case 'starter':
        return (BadgeVariant.secondary, 'STARTER');
      case 'growth':
        return (BadgeVariant.info, 'GROWTH');
      case 'professional':
        return (BadgeVariant.primary, 'PROFESSIONAL');
      case 'enterprise':
        return (BadgeVariant.warning, 'ENTERPRISE');
      default:
        return (BadgeVariant.secondary, tier.toUpperCase());
    }
  }
}
