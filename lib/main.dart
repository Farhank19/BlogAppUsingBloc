import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/blocs.dart';
import 'repositories/repositories.dart';
import 'router.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        RepositoryProvider(create: (_) => CategoryRepository()),
        RepositoryProvider(create: (_) => BlogRepository()),
        RepositoryProvider(create: (_) => ContactRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryBloc(context.read())..add(FetchCategories()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(412, 892),
          child: MaterialApp(
            title: 'Blog App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: AuthCheck(),
            onGenerateRoute: generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}

class AuthCheck extends StatelessWidget {
  Future<bool> _isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token') && prefs.getString('token')!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          return const HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
