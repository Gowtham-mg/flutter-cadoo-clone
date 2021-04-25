// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rank _$RankFromJson(Map<String, dynamic> json) {
  return Rank(
    json['id'] as String,
    json['rank'] as int,
    json['name'] as String,
    json['image'] as String,
    (json['amount'] as num)?.toDouble(),
    json['currency'] as String,
  );
}

Map<String, dynamic> _$RankToJson(Rank instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'name': instance.name,
      'image': instance.image,
      'amount': instance.amount,
      'currency': instance.currency,
    };
