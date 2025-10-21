import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

class CustomInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;

  const CustomInput({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.validator,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          focusNode: widget.focusNode,
          textCapitalization: widget.textCapitalization,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.primaryText,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(),
            filled: true,
            fillColor: widget.enabled ? AppColors.cardBackground : AppColors.disabledColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.accentBlue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintStyle: TextStyle(
              fontSize: 14,
              color: AppColors.placeholderColor,
            ),
            errorStyle: TextStyle(
              fontSize: 12,
              color: AppColors.error,
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.placeholderColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }
}

class SearchInput extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const SearchInput({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      hint: hint ?? 'Search...',
      controller: controller,
      onChanged: onChanged,
      prefixIcon: const Icon(Icons.search, color: AppColors.placeholderColor),
      suffixIcon: controller?.text.isNotEmpty == true
          ? IconButton(
              icon: const Icon(Icons.clear, color: AppColors.placeholderColor),
              onPressed: onClear,
            )
          : null,
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const PasswordInput({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return CustomInput(
      label: widget.label,
      hint: widget.hint ?? 'Enter password',
      errorText: widget.errorText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: true,
      prefixIcon: const Icon(Icons.lock_outline, color: AppColors.placeholderColor),
    );
  }
}
