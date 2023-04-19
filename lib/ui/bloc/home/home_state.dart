part of 'home_cubit.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

enum HomeStatus { initial, checking, success, failure }

extension HomeStatusX on HomeStatus {
  bool get initial => this == HomeStatus.initial;
  bool get loading => this == HomeStatus.checking;
  bool get success => this == HomeStatus.success;
  bool get failure => this == HomeStatus.failure;
}


class HomeState extends Equatable {
  final HomeStatus status;
  final bool? isEligible;

  const HomeState({this.status = HomeStatus.initial, this.isEligible});

  HomeState copyWith({HomeStatus? status, bool? user}) {
    return HomeState(status: status ?? this.status, isEligible: isEligible);
  }

  @override
  List<Object?> get props => [status, isEligible];
}
