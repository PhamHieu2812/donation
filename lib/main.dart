import 'dart:developer';

import 'package:donation/core/injection.dart';
import 'package:donation/features/default/presenter/app_home.dart';
import 'package:donation/features/default/presenter/bloc/app_home_bloc.dart';
import 'package:donation/features/goal/presenter/bloc/goal_bloc.dart';
import 'package:donation/features/goal/presenter/goal_screen.dart';
import 'package:donation/features/home/presenter/bloc/home_bloc.dart';
import 'package:donation/features/details/presenter/detail_screen.dart';
import 'package:donation/features/home/presenter/home_screen.dart';
import 'package:donation/features/login/presenter/bloc/login_bloc.dart';
import 'package:donation/features/login/presenter/login_screen.dart';
import 'package:donation/features/payment/presenter/bloc/payment_bloc.dart';
import 'package:donation/features/profile/presenter/bloc/profile_bloc.dart';
import 'package:donation/features/profile/presenter/profile_screen.dart';
import 'package:donation/features/register/presenter/bloc/register_bloc.dart';
import 'package:donation/features/register/presenter/register_screen.dart';
import 'package:donation/features/statistic/presenter/bloc/statistic_bloc.dart';
import 'package:donation/features/statistic/presenter/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injection.dependenciesInjection();
  log("APP RUNNING");
  runApp(const Donation());
}

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => getIt.get<HomeBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => getIt.get<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => getIt.get<RegisterBloc>(),
        ),
        BlocProvider<PaymentBloc>(
          create: (context) => getIt.get<PaymentBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>(),
        ),
        BlocProvider<AppHomeBloc>(
          create: (context) => getIt.get<AppHomeBloc>(),
        ),
        BlocProvider<StatisticBloc>(
          create: (context) => getIt.get<StatisticBloc>(),
        ),
        BlocProvider<GoalBloc>(
          create: (context) => getIt.get<GoalBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/register': (context) {
            return RegisterScreen();
          },
          '/login': (context) {
            return LoginScreen();
          },
          '/home': (context) {
            return HomeScreen();
          },
          '/detail': (context) {
            return DetailsScreen();
          },
          '/profile': (context) {
            return ProfileScreen();
          },
          '/statistic': (context) {
            return StatisticScreen();
          },
          '/goal': (context) {
            return GoalScreen();
          }
        },
        home: AppHome(),
      ),
    );
  }
}
