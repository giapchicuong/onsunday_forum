import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onsunday_forum/config/router.dart';
import 'package:onsunday_forum/config/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/http_client.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/data/auth_api_client.dart';
import 'features/auth/data/auth_local_data_source.dart';
import 'features/auth/data/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sf = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sf,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
          authApiClient: AuthApiClient(dio),
          authLocalDataSource: AuthLocalDataSource(sharedPreferences)),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routerConfig: router,
        ),
      ),
    );
  }
}
