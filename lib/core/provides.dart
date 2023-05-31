import 'package:donation/features/home/presenter/bloc/home_bloc.dart';
import 'package:donation/features/login/presenter/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<Widget> providers = [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
    BlocProvider(
      create: (context) => LoginBloc(),
    ),
  ];
}
