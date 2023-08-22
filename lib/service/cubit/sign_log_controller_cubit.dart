import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_log_controller_state.dart';

class SignLogControllerCubit extends Cubit<int> {
  SignLogControllerCubit() : super(0);
  void increment ()=>emit(state + 1);
}
