import 'package:donation/features/default/presenter/bloc/app_home_bloc.dart';
import 'package:donation/features/goal/presenter/bloc/goal_bloc.dart';
import 'package:donation/features/home/presenter/bloc/home_bloc.dart';
import 'package:donation/features/login/presenter/bloc/login_bloc.dart';
import 'package:donation/features/payment/bloc/payment_bloc.dart';
import 'package:donation/features/profile/presenter/bloc/profile_bloc.dart';
import 'package:donation/features/register/presenter/bloc/register_bloc.dart';
import 'package:donation/features/splash/presenter/bloc/splash_bloc.dart';
import 'package:donation/features/statistic/presenter/bloc/statistic_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static void dependenciesInjection() {
    getIt.registerSingleton<HomeBloc>(HomeBloc());
    getIt.registerSingleton<LoginBloc>(LoginBloc());
    getIt.registerSingleton<RegisterBloc>(RegisterBloc());
    getIt.registerSingleton<SplashBloc>(SplashBloc());
    getIt.registerSingleton<PaymentBloc>(PaymentBloc());
    getIt.registerSingleton<ProfileBloc>(ProfileBloc());
    getIt.registerSingleton<AppHomeBloc>(AppHomeBloc());
    getIt.registerSingleton<StatisticBloc>(StatisticBloc());
    getIt.registerSingleton<GoalBloc>(GoalBloc());
  }
}
