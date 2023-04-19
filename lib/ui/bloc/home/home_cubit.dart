import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_bank/model/user.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';


/**
 * Created by collins ihezie on 19/04/23
 */

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void checkLoadEligibility(User user) {
    emit(state.copyWith(status: HomeStatus.checking));

    if(user.bvnMatch == 'Y' && user.delinquentLoans == 'N' && _checkDate(user.customerDob!)){
      Future.delayed(const Duration(milliseconds: 1500), () {
        emit(state.copyWith(status: HomeStatus.success, user: true));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        emit(state.copyWith(status: HomeStatus.failure, user: false));
      });
    }
  }

  bool _checkDate(String date){
    DateTime birthday = DateFormat('dd-MM-yyyy').parse(date); // example birthday date
    DateTime now = DateTime.now();
    DateTime cutoff = DateTime(now.year - 18, now.month, now.day);

    if (birthday.isAfter(cutoff)) {
      return false;
    } else {
      return true;
    }
  }
}
