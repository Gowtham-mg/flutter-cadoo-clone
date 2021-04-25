// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['currency'] as String,
    json['title'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    (json['amount'] as num)?.toDouble(),
    json['id'] as String,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'amount': instance.amount,
      'id': instance.id,
    };
