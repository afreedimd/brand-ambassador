import 'package:flutter/material.dart';
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
  String _currentStep = 'intro'; // 'intro' or 'form'
  
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _handleController = TextEditingController();
  final _instagramController = TextEditingController();
  final _youtubeController = TextEditingController();
  final _twitterController = TextEditingController();
  final _bioController = TextEditingController();
  
  String _selectedCountry = 'United States';
  String _selectedCategory = 'Fashion & Style';
  
  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Other',
  ];
  
  final List<String> _categories = [
    'Fashion & Style',
    'Beauty & Makeup',
    'Fitness & Wellness',
    'Food & Beverage',
    'Travel & Adventure',
    'Tech & Gaming',
    'Lifestyle',
    'Sports',
    'Photography',
    'Music',
    'Business & Entrepreneurship',
    'Education',
    'Parenting & Family',
    'Pets & Animals',
    'Home & Decor',
    'Art & Design',
    'Comedy & Entertainment',
    'Sustainability & Eco',
    'Automotive',
    'Finance & Investment'
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _handleController.dispose();
    _instagramController.dispose();
    _youtubeController.dispose();
    _twitterController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application submitted successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/demo-switcher');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _currentStep == 'intro' ? _buildIntroStep() : _buildFormStep(),
    );
  }

  Widget _buildIntroStep() {
    return Column(
      children: [
        // Header
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.borderColor),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  // Logo and Brand
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '#',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Nike',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 24,
                        color: AppColors.borderColor,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Ambassador Program',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Status Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF10B981).withOpacity(0.5),
                      ),
                    ),
                    child: const Text(
                      'Applications Open',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF34D399),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Main Content
        Expanded(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
          child: Column(
            children: [
                // Hero Section
                const Text(
                  'Join the Nike Ambassador Program',
                  style: TextStyle(
                    fontSize: 48,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Represent a brand you love, earn rewards, and grow your influence',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // Video Card
                CustomCard(
                  child: Column(
                    children: [
                      // Video Placeholder
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_circle_filled,
                                size: 80,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Welcome Video from CMO',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome from our CMO',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Learn about our ambassador program, what we\'re looking for, and how you can earn while representing Nike.',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Benefits Grid
                Row(
                  children: [
                    Expanded(child: _buildBenefitCard(
                      icon: Icons.attach_money,
                      title: 'Earn Money',
                      description: 'Competitive commissions & bonuses',
                      color: const Color(0xFF10B981),
                    )),
                    const SizedBox(width: 16),
                    Expanded(child: _buildBenefitCard(
                      icon: Icons.trending_up,
                      title: 'Grow Your Brand',
                      description: 'Access to exclusive content',
                      color: const Color(0xFF3B82F6),
                    )),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildBenefitCard(
                      icon: Icons.people,
                      title: 'Join Community',
                      description: 'Network with other ambassadors',
                      color: const Color(0xFF8B5CF6),
                    )),
                    const SizedBox(width: 16),
                    Expanded(child: _buildBenefitCard(
                      icon: Icons.favorite,
                      title: 'Exclusive Perks',
                      description: 'Early product access & gifts',
                      color: const Color(0xFFEC4899),
                    )),
                  ],
                ),
                const SizedBox(height: 32),
                
                // CTA Button
                CustomButton(
                  text: 'Apply to Become an Ambassador',
                  onPressed: () => setState(() => _currentStep = 'form'),
                  isFullWidth: true,
                  backgroundColor: const Color(0xFF2563EB),
                  textColor: AppColors.primaryText,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Takes approximately 5 minutes • Free to apply',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.placeholderColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                size: 24,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormStep() {
    return Column(
      children: [
              // Header
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.borderColor),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  // Logo and Brand
                  Row(
                children: [
                  Container(
                        width: 40,
                        height: 40,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                    ),
                        child: const Center(
                      child: Text(
                        '#',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Nike',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 24,
                        color: AppColors.borderColor,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Ambassador Application',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Back Button
                  TextButton(
                    onPressed: () => setState(() => _currentStep = 'intro'),
                    child: const Text(
                      '← Back to Video',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                ],
                        ),
                      ),
                    ),
                  ),
                  
        // Form Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Text(
                    'Ambassador Application',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tell us about yourself and why you\'d be a great fit for the Nike brand.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Personal Information Section
                  CustomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 20,
                                color: AppColors.primaryText,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                  ),
                ],
              ),
                          const SizedBox(height: 24),
                          
                          // Name Fields
                          Row(
                    children: [
                              Expanded(
                                child: CustomInput(
                                  label: 'First Name *',
                                  hint: 'John',
                                  controller: _firstNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'First name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomInput(
                                  label: 'Last Name *',
                                  hint: 'Doe',
                                  controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                                      return 'Last name is required';
                          }
                          return null;
                        },
                      ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                      
                      // Email Field
                      CustomInput(
                            label: 'Email Address *',
                            hint: 'john@example.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: AppColors.placeholderColor,
                            ),
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
                          const SizedBox(height: 20),
                          
                          // Country Dropdown
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Country *',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                value: _selectedCountry,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.cardBackground,
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
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                                items: _countries.map((country) {
                                  return DropdownMenuItem(
                                    value: country,
                                    child: Text(
                                      country,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCountry = value ?? 'United States';
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Influencer Profile Section
                  CustomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.emoji_events,
                                size: 20,
                                color: AppColors.primaryText,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Influencer Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          // Primary Handle
                      CustomInput(
                            label: 'Primary Handle/Username *',
                            hint: '@yourhandle',
                            controller: _handleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                                return 'Primary handle is required';
                          }
                          return null;
                        },
                      ),
                          const SizedBox(height: 20),
                      
                      // Category Dropdown
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              const Text(
                                'Influencer Category *',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: _selectedCategory,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.cardBackground,
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
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            items: _categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText,
                                      ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                    _selectedCategory = value ?? 'Fashion & Style';
                              });
                            },
                          ),
                        ],
                      ),
                          const SizedBox(height: 20),
                          
                          // Social Media Accounts
                          const Text(
                            'Social Media Accounts *',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Connect at least one account',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondaryText,
                            ),
                          ),
                          const SizedBox(height: 12),
                          
                          // Instagram
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomInput(
                                  hint: 'Instagram username',
                                  controller: _instagramController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          
                          // YouTube
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFEF4444), Color(0xFFEC4899)],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.play_circle_filled,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomInput(
                                  hint: 'YouTube channel URL',
                                  controller: _youtubeController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          
                          // Twitter
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.alternate_email,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomInput(
                                  hint: 'Twitter/X handle',
                                  controller: _twitterController,
                                ),
                              ),
                            ],
                      ),
                    ],
                  ),
                ),
              ),
                  const SizedBox(height: 24),
                  
                  // Submit Button
                  CustomButton(
                    text: 'Submit Application',
                    onPressed: _handleSubmit,
                    isFullWidth: true,
                    backgroundColor: const Color(0xFF2563EB),
                    textColor: AppColors.primaryText,
              ),
            ],
          ),
        ),
      ),
        ),
      ],
    );
  }
}