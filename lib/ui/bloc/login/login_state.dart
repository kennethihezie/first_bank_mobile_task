part of 'login_cubit.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

enum LoginStatus { initial, loading, success, failure }

extension LoginStatusX on LoginStatus {
  bool get initial => this == LoginStatus.initial;
  bool get loading => this == LoginStatus.loading;
  bool get success => this == LoginStatus.success;
  bool get failure => this == LoginStatus.failure;
}


class LoginState extends Equatable {
  final LoginStatus status;
  final User? user;

  const LoginState({this.status = LoginStatus.initial, this.user});

  LoginState copyWith({LoginStatus? status, User? user}) {
    return LoginState(status: status ?? this.status, user: user);
  }

  @override
  List<Object?> get props => [status, user];
}
