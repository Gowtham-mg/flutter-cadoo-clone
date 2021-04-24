import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction {
  final String currency;
  final String title;
  final DateTime date;
  final double amount;

  Transaction(this.currency, this.title, this.date, this.amount);

  Transaction.named({this.currency, this.title, this.date, this.amount});

  Transaction copyWith(
      {String currency, String title, DateTime date, double amount}) {
    return Transaction.named(
      currency: currency ?? this.currency,
      title: title ?? this.title,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);
}
