import 'dart:convert';
import 'package:ipresent/core/enums/user_type.dart';

class AppUser {
  String? uid;
  String? comment;
  DateTime? createdAt;
  // DateTime editedAt;
  String? email;
  String? emailNotification;
  String? name;
  String? phone;
  String? phoneAlternate;
  String? phoneNotification;
  UserType? type;
  String? userId;
  String? branch;

  AppUser({
    this.uid,
    this.comment,
    this.createdAt,
    // this.editedAt,
    this.email,
    this.emailNotification,
    this.name,
    this.phone,
    this.phoneAlternate,
    this.phoneNotification,
    this.userId,
    this.branch,
    String? type,
  }) {
    this.type = type!.userTypeValue;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'comment': comment,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      // 'editedAt': editedAt?.millisecondsSinceEpoch,
      'email': email,
      'emailNotification': emailNotification,
      'name': name,
      'phone': phone,
      'phoneAlternate': phoneAlternate,
      'phoneNotification': phoneNotification,
      'userId': userId,
      'branch': branch,
      'type': type!.code,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null!;

    return AppUser(
      uid: map['uid'],
      comment: map['comment'],
      createdAt: map['createdAt'].toDate(),
      // editedAt: map['editedAt'].toDate(),
      email: map['email'],
      emailNotification: map['emailNotification'],
      name: map['name'],
      phone: map['phone'],
      phoneAlternate: map['phoneAlternate'],
      phoneNotification: map['phoneNotification'],
      userId: map['userId'],
      branch: map['branch'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, comment: $comment, createdAt: $createdAt, email: $email, emailNotification: $emailNotification, name: $name, phone: $phone, phoneAlternate: $phoneAlternate, phoneNotification: $phoneNotification, userId: $userId, branch: $branch, type: ${type!.code})';
  }
}
