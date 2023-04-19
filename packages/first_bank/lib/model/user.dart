import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

@JsonSerializable()
class User {
  int? customerId;
  String? firstName, lastName, customerDob, bvnMatch, delinquentLoans;


  User({this.customerId, this.firstName, this.lastName, this.customerDob,
    this.bvnMatch, this.delinquentLoans});


  @override
  String toString() {
    return 'User{customerId: $customerId, firstName: $firstName, lastName: $lastName, customerDob: $customerDob, bvnMatch: $bvnMatch, delinquentLoans: $delinquentLoans}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toMap(User user){
    return _$UserToJson(user);
  }
}
