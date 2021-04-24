// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeStat _$ChallengeStatFromJson(Map<String, dynamic> json) {
  return ChallengeStat(
    json['participants'] as int,
    (json['prizePool'] as num)?.toDouble(),
    json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    json['endDate'] == null ? null : DateTime.parse(json['endDate'] as String),
    json['registrationEndDate'] == null
        ? null
        : DateTime.parse(json['registrationEndDate'] as String),
  );
}

Map<String, dynamic> _$ChallengeStatToJson(ChallengeStat instance) =>
    <String, dynamic>{
      'participants': instance.participants,
      'prizePool': instance.prizePool,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'registrationEndDate': instance.registrationEndDate?.toIso8601String(),
    };
