import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

enum ButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
  destructive,
}

enum ButtonSize {
  small,
  medium,
  large,
  icon,
}

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;

  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
        ),
      );
    }

    if (icon != null && text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          SizedBox(width: 8),
          Text(text!),
        ],
      );
    }

    if (icon != null) {
      return icon!;
    }

    return Text(text ?? '');
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getTextColor(),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? _getBorderRadius()),
        side: _getBorderSide(),
      ),
      padding: _getPadding(),
      textStyle: _getTextStyle(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.accentBlue;
      case ButtonVariant.secondary:
        return AppColors.cardBackground;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return Colors.transparent;
      case ButtonVariant.destructive:
        return AppColors.error;
    }
  }

  Color _getTextColor() {
    if (textColor != null) return textColor!;
    
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primaryText;
      case ButtonVariant.secondary:
        return AppColors.primaryText;
      case ButtonVariant.outline:
        return AppColors.secondaryText;
      case ButtonVariant.ghost:
        return AppColors.secondaryText;
      case ButtonVariant.destructive:
        return AppColors.primaryText;
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case ButtonVariant.outline:
        return const BorderSide(color: AppColors.borderColor);
      case ButtonVariant.ghost:
        return BorderSide.none;
      default:
        return BorderSide.none;
    }
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 48;
      case ButtonSize.icon:
        return 40;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
      case ButtonSize.icon:
        return 20;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case ButtonSize.icon:
        return EdgeInsets.all(8);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ButtonSize.small:
        return 6;
      case ButtonSize.medium:
        return 8;
      case ButtonSize.large:
        return 10;
      case ButtonSize.icon:
        return 8;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case ButtonSize.small:
        return TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
      case ButtonSize.medium:
        return TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
      case ButtonSize.large:
        return TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
      case ButtonSize.icon:
        return TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
    }
  }
}
