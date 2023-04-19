import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_bank/model/user.dart';
import 'package:first_bank/repository/repository.dart';

part 'login_state.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class LoginCubit extends Cubit<LoginState> {
  final RepositoryService _repositoryService;
  LoginCubit(this._repositoryService) : super (const LoginState());

  Future<void> loginUser({required int customerId}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final user = await _repositoryService.getUserByCustomerId(customerId);

    if(user != null){
      Future.delayed(const Duration(milliseconds: 1500), () {
        emit(state.copyWith(status: LoginStatus.success, user: user));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        emit(state.copyWith(status: LoginStatus.failure, user: user));
      });
    }
  }
}
