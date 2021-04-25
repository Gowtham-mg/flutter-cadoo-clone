import 'package:cadoo/models/challenge_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class ChallengeDetail {
  final String title;
  final String id;
  final String description;
  final ChallengeStat challengeStat;
  final bool isJoined;
  final String icon;

  ChallengeDetail(
    this.title,
    this.description,
    this.challengeStat,
    this.isJoined,
    this.icon,
    this.id,
  );

  ChallengeDetail.named({
    this.title,
    this.description,
    this.challengeStat,
    this.isJoined,
    this.icon,
    this.id,
  });

  ChallengeDetail copyWith({
    String title,
    String description,
    ChallengeStat challengeStat,
    bool isJoined,
    String icon,
    String id,
  }) {
    return ChallengeDetail.named(
      title: title ?? this.title,
      description: description ?? this.description,
      challengeStat: challengeStat ?? this.challengeStat,
      isJoined: isJoined ?? this.isJoined,
      icon: icon ?? this.icon,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() => _$ChallengeDetailToJson(this);

  factory ChallengeDetail.fromJson(json) => _$ChallengeDetailFromJson(json);
}
