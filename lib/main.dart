import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/app_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'core/network/simple_api_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive, SharedPreferences, etc.
  // await Hive.initFlutter();
  
  runApp(const BrandAmbassadorApp());
}

class BrandAmbassadorApp extends StatelessWidget {
  const BrandAmbassadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                loginUseCase: LoginUseCase(AuthRepositoryImpl(apiClient: SimpleApiClientFactory.create())),
                logoutUseCase: LogoutUseCase(AuthRepositoryImpl(apiClient: SimpleApiClientFactory.create())),
                checkAuthStatusUseCase: CheckAuthStatusUseCase(AuthRepositoryImpl(apiClient: SimpleApiClientFactory.create())),
              ),
            ),
          ],
          child: MaterialApp.router(
            title: 'Brand Ambassador',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
