import 'dart:io';
import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../../shared/models/user_model.dart';

class SimpleApiClient {
  final Dio _dio;

  SimpleApiClient(this._dio);

  // Auth endpoints
  Future<AuthResponse> login(Map<String, dynamic> loginData) async {
    final response = await _dio.post('/auth/login', data: loginData);
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> register(Map<String, dynamic> registerData) async {
    final response = await _dio.post('/auth/register', data: registerData);
    return AuthResponse.fromJson(response.data);
  }

  Future<Map<String, dynamic>> logout() async {
    final response = await _dio.post('/auth/logout');
    return response.data;
  }

  Future<AuthResponse> refreshToken(Map<String, dynamic> tokenData) async {
    final response = await _dio.post('/auth/refresh', data: tokenData);
    return AuthResponse.fromJson(response.data);
  }

  // User endpoints
  Future<UserModel> getUserProfile() async {
    final response = await _dio.get('/user/profile');
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateUserProfile(Map<String, dynamic> profileData) async {
    final response = await _dio.put('/user/profile', data: profileData);
    return UserModel.fromJson(response.data);
  }

  // Campaign endpoints
  Future<Map<String, dynamic>> getCampaigns(Map<String, dynamic>? queries) async {
    final response = await _dio.get('/campaigns', queryParameters: queries);
    return response.data;
  }

  Future<Map<String, dynamic>> getCampaign(String id) async {
    final response = await _dio.get('/campaigns/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> createCampaign(Map<String, dynamic> campaignData) async {
    final response = await _dio.post('/campaigns', data: campaignData);
    return response.data;
  }

  Future<Map<String, dynamic>> updateCampaign(String id, Map<String, dynamic> campaignData) async {
    final response = await _dio.put('/campaigns/$id', data: campaignData);
    return response.data;
  }

  Future<Map<String, dynamic>> deleteCampaign(String id) async {
    final response = await _dio.delete('/campaigns/$id');
    return response.data;
  }

  // Influencer endpoints
  Future<Map<String, dynamic>> getInfluencers(Map<String, dynamic>? queries) async {
    final response = await _dio.get('/influencers', queryParameters: queries);
    return response.data;
  }

  Future<Map<String, dynamic>> getInfluencer(String id) async {
    final response = await _dio.get('/influencers/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> approveInfluencer(String id) async {
    final response = await _dio.post('/influencers/$id/approve');
    return response.data;
  }

  Future<Map<String, dynamic>> denyInfluencer(String id) async {
    final response = await _dio.post('/influencers/$id/deny');
    return response.data;
  }

  Future<Map<String, dynamic>> embargoInfluencer(String id) async {
    final response = await _dio.post('/influencers/$id/embargo');
    return response.data;
  }

  // Analytics endpoints
  Future<Map<String, dynamic>> getDashboardAnalytics() async {
    final response = await _dio.get('/analytics/dashboard');
    return response.data;
  }

  Future<Map<String, dynamic>> getCampaignAnalytics(String id) async {
    final response = await _dio.get('/analytics/campaigns/$id');
    return response.data;
  }

  // File upload endpoints
  Future<Map<String, dynamic>> uploadImage(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    final response = await _dio.post('/upload/image', data: formData);
    return response.data;
  }

  Future<Map<String, dynamic>> uploadDocument(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    final response = await _dio.post('/upload/document', data: formData);
    return response.data;
  }
}

class SimpleApiClientFactory {
  static SimpleApiClient create() {
    final dio = Dio();
    
    // Configure base URL
    dio.options.baseUrl = AppConstants.baseUrl;
    
    // Configure interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          // options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          // Handle common errors
          handler.next(error);
        },
      ),
    );

    // Add logging interceptor in debug mode
    if (true) { // Replace with kDebugMode
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }

    return SimpleApiClient(dio);
  }
}
