// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      customerId: json['customerId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      customerDob: json['customerDob'] as String?,
      bvnMatch: json['bvnMatch'] as String?,
      delinquentLoans: json['delinquentLoans'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'customerDob': instance.customerDob,
      'bvnMatch': instance.bvnMatch,
      'delinquentLoans': instance.delinquentLoans,
    };
