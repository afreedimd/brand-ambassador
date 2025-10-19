import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_input.dart';
import '../../../../shared/widgets/custom_card.dart';

class InfluencerSignupPage extends StatefulWidget {
  const InfluencerSignupPage({super.key});

  @override
  State<InfluencerSignupPage> createState() => _InfluencerSignupPageState();
}

class _InfluencerSignupPageState extends State<InfluencerSignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _instagramController = TextEditingController();
  final _followersController = TextEditingController();
  final _bioController = TextEditingController();
  
  String _selectedCategory = 'Lifestyle';
  final List<String> _categories = [
    'Lifestyle',
    'Fashion',
    'Fitness',
    'Food',
    'Travel',
    'Tech',
    'Beauty',
    'Gaming',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _instagramController.dispose();
    _followersController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle signup logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application submitted successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      
      // Navigate back after a delay
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/demo-switcher');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => context.go('/demo-switcher'),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // Header
              Column(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                      child: Text(
                        '#',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  Text(
                    'Join as Influencer',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  Text(
                    'Apply to become a brand ambassador',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.secondaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              
              SizedBox(height: 32.h),
              
              // Signup Form
              CustomCard(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name Field
                      CustomInput(
                        label: 'Full Name',
                        hint: 'Enter your full name',
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Email Field
                      CustomInput(
                        label: 'Email',
                        hint: 'Enter your email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!AppUtils.isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Instagram Handle
                      CustomInput(
                        label: 'Instagram Handle',
                        hint: '@yourusername',
                        controller: _instagramController,
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                          color: AppColors.placeholderColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Instagram handle is required';
                          }
                          return null;
                        },
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Followers Count
                      CustomInput(
                        label: 'Follower Count',
                        hint: 'e.g., 10000',
                        controller: _followersController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Follower count is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Category Dropdown
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: 8.h),
                          DropdownButtonFormField<String>(
                            value: _selectedCategory,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.cardBackground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(color: AppColors.borderColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(color: AppColors.borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(color: AppColors.accentBlue, width: 2),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            ),
                            items: _categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value ?? 'Lifestyle';
                              });
                            },
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Bio Field
                      CustomInput(
                        label: 'Bio',
                        hint: 'Tell us about yourself...',
                        controller: _bioController,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bio is required';
                          }
                          return null;
                        },
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Submit Button
                      CustomButton(
                        text: 'Submit Application',
                        onPressed: _handleSignup,
                        isFullWidth: true,
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 24.h),
              
              // Footer
              Text(
                'We\'ll review your application and get back to you soon!',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.placeholderColor,
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
