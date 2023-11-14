class AppConstants{




}

enum UserTypes {
  ADMIN,
  USER

}


extension PaymentMethodExtension on UserTypes {
  String get displayName {
    switch (this) {
      case UserTypes.ADMIN:
        return 'ADMIN';
      case UserTypes.USER:
        return 'USER';
    }
  }
}