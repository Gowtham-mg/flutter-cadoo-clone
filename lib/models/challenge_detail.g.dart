// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeDetail _$ChallengeDetailFromJson(Map<String, dynamic> json) {
  return ChallengeDetail(
    json['title'] as String,
    json['description'] as String,
    json['challengeStat'] == null
        ? null
        : ChallengeStat.fromJson(json['challengeStat']),
    json['isJoined'] as bool,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$ChallengeDetailToJson(ChallengeDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'challengeStat': instance.challengeStat?.toJson(),
      'isJoined': instance.isJoined,
      'icon': instance.icon,
    };
