// {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },

import 'package:equatable/equatable.dart';
import 'package:flutter_use_case/core/data/model/address.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;

  User({this.id, this.name, this.username, this.email, this.address});
  
  @override
  List<Object?> get props => [id, name, username, email, address];

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }
}

