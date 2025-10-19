import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../constants/app_constants.dart';
import '../../shared/models/user_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth endpoints
  @POST('/auth/login')
  Future<AuthResponse> login(@Body() Map<String, dynamic> loginData);

  @POST('/auth/register')
  Future<AuthResponse> register(@Body() Map<String, dynamic> registerData);

  @POST('/auth/logout')
  Future<Map<String, dynamic>> logout();

  @POST('/auth/refresh')
  Future<AuthResponse> refreshToken(@Body() Map<String, dynamic> tokenData);

  // User endpoints
  @GET('/user/profile')
  Future<UserModel> getUserProfile();

  @PUT('/user/profile')
  Future<UserModel> updateUserProfile(@Body() Map<String, dynamic> profileData);

  // Campaign endpoints
  @GET('/campaigns')
  Future<String> getCampaigns(@Queries() Map<String, dynamic>? queries);

  @GET('/campaigns/{id}')
  Future<String> getCampaign(@Path('id') String id);

  @POST('/campaigns')
  Future<String> createCampaign(@Body() Map<String, dynamic> campaignData);

  @PUT('/campaigns/{id}')
  Future<String> updateCampaign(@Path('id') String id, @Body() Map<String, dynamic> campaignData);

  @DELETE('/campaigns/{id}')
  Future<String> deleteCampaign(@Path('id') String id);

  // Influencer endpoints
  @GET('/influencers')
  Future<String> getInfluencers(@Queries() Map<String, dynamic>? queries);

  @GET('/influencers/{id}')
  Future<String> getInfluencer(@Path('id') String id);

  @POST('/influencers/{id}/approve')
  Future<String> approveInfluencer(@Path('id') String id);

  @POST('/influencers/{id}/deny')
  Future<String> denyInfluencer(@Path('id') String id);

  @POST('/influencers/{id}/embargo')
  Future<String> embargoInfluencer(@Path('id') String id);

  // Analytics endpoints
  @GET('/analytics/dashboard')
  Future<String> getDashboardAnalytics();

  @GET('/analytics/campaigns/{id}')
  Future<String> getCampaignAnalytics(@Path('id') String id);

  // File upload endpoints
  @POST('/upload/image')
  @MultiPart()
  Future<String> uploadImage(@Part() File file);

  @POST('/upload/document')
  @MultiPart()
  Future<String> uploadDocument(@Part() File file);
}

class ApiClientFactory {
  static ApiClient create() {
    final dio = Dio();
    
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

    return ApiClient(dio);
  }
}
