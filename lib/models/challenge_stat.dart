import 'package:json_annotation/json_annotation.dart';

part 'challenge_stat.g.dart';

@JsonSerializable(explicitToJson: true)
class ChallengeStat {
  final int participants;
  final double prizePool;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime registrationEndDate;

  ChallengeStat(
    this.participants,
    this.prizePool,
    this.startDate,
    this.endDate,
    this.registrationEndDate,
  );

  ChallengeStat.named({
    this.participants,
    this.prizePool,
    this.startDate,
    this.endDate,
    this.registrationEndDate,
  });

  ChallengeStat copyWith({
    int participants,
    double prizePool,
    DateTime startDate,
    DateTime endDate,
    DateTime registrationEndDate,
  }) {
    return ChallengeStat.named(
      participants: participants ?? this.participants,
      prizePool: prizePool ?? this.prizePool,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      registrationEndDate: registrationEndDate ?? this.registrationEndDate,
    );
  }

  Map<String, dynamic> toJson() => _$ChallengeStatToJson(this);

  factory ChallengeStat.fromJson(json) => _$ChallengeStatFromJson(json);
}
