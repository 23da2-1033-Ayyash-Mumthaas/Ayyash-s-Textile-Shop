import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

@freezed
class AdminModel with _$AdminModel {
  const AdminModel._();

  const factory AdminModel({
    required String id,
    required String email,
    @Default('') String displayName,
    @Default(['admin']) List<String> roles,
    @Default(true) bool isActive,
    @TimestampConverter() DateTime? createdAt,
  }) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);

  bool get isSuperAdmin => roles.contains('super_admin');
}
