
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool choose1=false;
  bool choose2=false;

  changeUser(bool ch1,bool ch2){
    choose1=ch1;
    choose2=ch2;
    print(choose1);
    print(choose2);
    emit(RegisterUserChanged());
  }
}
