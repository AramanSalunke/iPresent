enum UserType { ADMIN, USER, UNKNOWN }

extension UserType_Ext on UserType {
  String? get code {
    switch (this) {
      case UserType.ADMIN:
        return "admin";
      case UserType.USER:
        return "user";
      case UserType.UNKNOWN:
        return "unknown";
      default:
        return "unknown";
    }
  }
}

extension UserType_Helper on String {
  UserType get userTypeValue {
    switch (this.toLowerCase()) {
      case "player":
        return UserType.ADMIN;
      case "user":
        return UserType.USER;
      case "unknown":
        return UserType.UNKNOWN;
      default:
        return UserType.UNKNOWN;
    }
  }
}
