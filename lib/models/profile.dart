import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String street;
  final String zipCode;
  final String country;
  final String state;
  final String city;

  Profile(
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.street,
    this.zipCode,
    this.country,
    this.state,
    this.city,
  );

  Profile.named({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.street,
    this.zipCode,
    this.country,
    this.state,
    this.city,
  });

  Profile copyWith({
    String firstName,
    String lastName,
    String email,
    String mobile,
    String street,
    String zipCode,
    String country,
    String state,
    String city,
  }) {
    return Profile.named(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      street: street ?? this.street,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  factory Profile.fromJson(json) => _$ProfileFromJson(json);
}
