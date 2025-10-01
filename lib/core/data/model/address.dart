import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';
@JsonSerializable()
class Address extends Equatable {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Map<String, String>? geo;
  Address({this.street, this.suite, this.city, this.zipcode, this.geo});
  
  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];

    Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Map<String, String>? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

}