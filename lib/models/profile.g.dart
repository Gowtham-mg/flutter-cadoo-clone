// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
    json['mobile'] as String,
    json['street'] as String,
    json['zipCode'] as String,
    json['country'] as String,
    json['state'] as String,
    json['city'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'street': instance.street,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'id': instance.id,
    };
