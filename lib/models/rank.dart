import 'package:json_annotation/json_annotation.dart';

part 'rank.g.dart';

@JsonSerializable(explicitToJson: true)
class Rank {
  final String id;
  final int rank;
  final String name;
  final String image;
  final double amount;
  final String currency;

  Rank(this.id, this.rank, this.name, this.image, this.amount, this.currency);
  Rank.named({
    this.id,
    this.rank,
    this.name,
    this.image,
    this.amount,
    this.currency,
  });

  Rank copyWith({
    String id,
    int rank,
    String name,
    String image,
    double amount,
    String currency,
  }) {
    return Rank.named(
      id: id ?? this.id,
      rank: rank ?? this.rank,
      name: name ?? this.name,
      image: image ?? this.image,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toJson() => _$RankToJson(this);

  factory Rank.fromJson(json) => _$RankFromJson(json);
}
