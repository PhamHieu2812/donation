import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_home_event.dart';
part 'app_home_state.dart';

class AppHomeBloc extends Bloc<AppHomeEvent, AppHomeState> {
  AppHomeBloc() : super(AppHomeInitial()) {
    on<AppHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
