import 'package:bloc/bloc.dart';

import '../../../common/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  // super olarak login initial veriyoruz.
  LoginCubit(this.authRepository) : super(LoginInitial());

  // login istegi atılıyor
  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    try {
      final user = await authRepository.login(username, password);
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFailed());
      rethrow;
    }
  }

}
