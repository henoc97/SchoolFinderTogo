
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_ctlr_state.dart';

class MenuCtlrCubit extends Cubit<double> {
  MenuCtlrCubit() : super(0);

  void sateOne ()=>emit(1);
  void sateZero ()=>emit(0);
}
