import 'package:flutter/material.dart';
import 'package:flutter_auth_cubits/common/repository/current_auth/current_auth_repository_implement.dart';
import 'package:flutter_auth_cubits/common/repository/login_auth/auth_repository_implements.dart';
import 'package:flutter_auth_cubits/common/service/current_auth_api_service.dart';
import 'package:flutter_auth_cubits/ui/login/cubit/login_cubit.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/service/auth_api_service.dart';
import 'core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(
            AuthRepositoryImplements(
              authService: AuthApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => ProfileCubit(
            CurrentAuthRepositoryImplements(
              currentAuthService: CurrenrAuthApiService(),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
