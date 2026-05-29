import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserAddress with _$UserAddress {
  const factory UserAddress({
    required String id,
    @Default('') String line1,
    @Default('') String city,
    @Default('') String phone,
    @Default(false) bool isDefault,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phone,
    @Default('') String city,
    @Default('') String photoUrl,
    @Default([]) List<UserAddress> addresses,
    @Default('customer') String role,
    @Default(false) bool isBlocked,
    @Default('') String fcmToken,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String get fullName => '$firstName $lastName'.trim();

  String get defaultAddress {
    if (addresses.isEmpty) return '';
    final def = addresses.where((a) => a.isDefault);
    return (def.isNotEmpty ? def.first : addresses.first).line1;
  }
}
