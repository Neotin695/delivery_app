// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../../../../../models/model.dart';

// ignore: must_be_immutable
class Delegate extends Equatable {
  String id;
  String photoUrl;
  String birthOfDate;
  String name;
  IdCard idCard;
  String phoneNum;
  String email;
  String token;
  String vehicle;
  bool active;
  bool acceptable;
  bool isEmailVerified;
  bool available;
  AddressInfo location;

  Delegate({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.idCard,
    required this.phoneNum,
    required this.email,
    required this.token,
    required this.active,
    required this.acceptable,
    required this.isEmailVerified,
    required this.location,
    required this.available,
    required this.birthOfDate,
    required this.vehicle,
  });

  static Delegate empty() => Delegate(
        id: '',
        photoUrl: '',
        name: '',
        idCard: IdCard.empty(),
        phoneNum: '',
        email: '',
        token: '',
        acceptable: false,
        active: false,
        isEmailVerified: false,
        location: AddressInfo.empty(),
        available: false,
        birthOfDate: '',
        vehicle: '',
      );

  @override
  List<Object?> get props => [
        id,
        photoUrl,
        name,
        idCard,
        phoneNum,
        email,
        active,
        isEmailVerified,
        location,
        token,
        acceptable,
        available,
        birthOfDate,
        vehicle
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'photoUrl': photoUrl,
      'name': name,
      'idCard': idCard.toMap(),
      'phoneNum': phoneNum,
      'email': email,
      'acceptable': acceptable,
      'active': active,
      'token': token,
      'isEmailVerified': isEmailVerified,
      'location': location.toMap(),
      'available': available,
      'birthOfDate': birthOfDate,
      'vehicle': vehicle,
    };
  }

  factory Delegate.fromMap(Map<String, dynamic> map) {
    return Delegate(
      acceptable: map['acceptable'] as bool,
      active: map['active'] as bool,
      available: map['available'] as bool,
      birthOfDate: map['birthOfDate'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      idCard: IdCard.fromMap(map['idCard'] as Map<String, dynamic>),
      isEmailVerified: map['isEmailVerified'] as bool,
      location: AddressInfo.fromMap(map['location'] as Map<String, dynamic>),
      name: map['name'] as String,
      phoneNum: map['phoneNum'] as String,
      photoUrl: map['photoUrl'] as String,
      token: map['token'] as String,
      vehicle: map['vehicle'] as String,
    );
  }

  Delegate copyWith({
    String? id,
    String? photoUrl,
    String? birthOfDate,
    String? name,
    IdCard? idCard,
    String? phoneNum,
    String? email,
    String? token,
    String? vehicle,
    bool? active,
    bool? acceptable,
    bool? isEmailVerified,
    bool? available,
    AddressInfo? location,
  }) {
    return Delegate(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      birthOfDate: birthOfDate ?? this.birthOfDate,
      name: name ?? this.name,
      idCard: idCard ?? this.idCard,
      phoneNum: phoneNum ?? this.phoneNum,
      email: email ?? this.email,
      token: token ?? this.token,
      vehicle: vehicle ?? this.vehicle,
      active: active ?? this.active,
      acceptable: acceptable ?? this.acceptable,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      available: available ?? this.available,
      location: location ?? this.location,
    );
  }
}
