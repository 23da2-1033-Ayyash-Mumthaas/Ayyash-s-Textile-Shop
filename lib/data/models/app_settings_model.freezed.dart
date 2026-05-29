// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  String get appName => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  String get darkLogoUrl => throw _privateConstructorUsedError;
  double get taxPercent => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DeliveryRules get deliveryRules => throw _privateConstructorUsedError;
  bool get flashSaleEnabled => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
    AppSettingsModel value,
    $Res Function(AppSettingsModel) then,
  ) = _$AppSettingsModelCopyWithImpl<$Res, AppSettingsModel>;
  @useResult
  $Res call({
    String appName,
    String logoUrl,
    String darkLogoUrl,
    double taxPercent,
    String currency,
    DeliveryRules deliveryRules,
    bool flashSaleEnabled,
    @TimestampConverter() DateTime? updatedAt,
  });

  $DeliveryRulesCopyWith<$Res> get deliveryRules;
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res, $Val extends AppSettingsModel>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? logoUrl = null,
    Object? darkLogoUrl = null,
    Object? taxPercent = null,
    Object? currency = null,
    Object? deliveryRules = null,
    Object? flashSaleEnabled = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            appName: null == appName
                ? _value.appName
                : appName // ignore: cast_nullable_to_non_nullable
                      as String,
            logoUrl: null == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            darkLogoUrl: null == darkLogoUrl
                ? _value.darkLogoUrl
                : darkLogoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            taxPercent: null == taxPercent
                ? _value.taxPercent
                : taxPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryRules: null == deliveryRules
                ? _value.deliveryRules
                : deliveryRules // ignore: cast_nullable_to_non_nullable
                      as DeliveryRules,
            flashSaleEnabled: null == flashSaleEnabled
                ? _value.flashSaleEnabled
                : flashSaleEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryRulesCopyWith<$Res> get deliveryRules {
    return $DeliveryRulesCopyWith<$Res>(_value.deliveryRules, (value) {
      return _then(_value.copyWith(deliveryRules: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsModelImplCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$AppSettingsModelImplCopyWith(
    _$AppSettingsModelImpl value,
    $Res Function(_$AppSettingsModelImpl) then,
  ) = __$$AppSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String appName,
    String logoUrl,
    String darkLogoUrl,
    double taxPercent,
    String currency,
    DeliveryRules deliveryRules,
    bool flashSaleEnabled,
    @TimestampConverter() DateTime? updatedAt,
  });

  @override
  $DeliveryRulesCopyWith<$Res> get deliveryRules;
}

/// @nodoc
class __$$AppSettingsModelImplCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$AppSettingsModelImpl>
    implements _$$AppSettingsModelImplCopyWith<$Res> {
  __$$AppSettingsModelImplCopyWithImpl(
    _$AppSettingsModelImpl _value,
    $Res Function(_$AppSettingsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? logoUrl = null,
    Object? darkLogoUrl = null,
    Object? taxPercent = null,
    Object? currency = null,
    Object? deliveryRules = null,
    Object? flashSaleEnabled = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$AppSettingsModelImpl(
        appName: null == appName
            ? _value.appName
            : appName // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: null == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        darkLogoUrl: null == darkLogoUrl
            ? _value.darkLogoUrl
            : darkLogoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        taxPercent: null == taxPercent
            ? _value.taxPercent
            : taxPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryRules: null == deliveryRules
            ? _value.deliveryRules
            : deliveryRules // ignore: cast_nullable_to_non_nullable
                  as DeliveryRules,
        flashSaleEnabled: null == flashSaleEnabled
            ? _value.flashSaleEnabled
            : flashSaleEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsModelImpl implements _AppSettingsModel {
  const _$AppSettingsModelImpl({
    this.appName = "Ayyash's Textile Shop",
    this.logoUrl = '',
    this.darkLogoUrl = '',
    this.taxPercent = 0.0,
    this.currency = 'PKR',
    this.deliveryRules = const DeliveryRules(),
    this.flashSaleEnabled = false,
    @TimestampConverter() this.updatedAt,
  });

  factory _$AppSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsModelImplFromJson(json);

  @override
  @JsonKey()
  final String appName;
  @override
  @JsonKey()
  final String logoUrl;
  @override
  @JsonKey()
  final String darkLogoUrl;
  @override
  @JsonKey()
  final double taxPercent;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final DeliveryRules deliveryRules;
  @override
  @JsonKey()
  final bool flashSaleEnabled;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AppSettingsModel(appName: $appName, logoUrl: $logoUrl, darkLogoUrl: $darkLogoUrl, taxPercent: $taxPercent, currency: $currency, deliveryRules: $deliveryRules, flashSaleEnabled: $flashSaleEnabled, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsModelImpl &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.darkLogoUrl, darkLogoUrl) ||
                other.darkLogoUrl == darkLogoUrl) &&
            (identical(other.taxPercent, taxPercent) ||
                other.taxPercent == taxPercent) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.deliveryRules, deliveryRules) ||
                other.deliveryRules == deliveryRules) &&
            (identical(other.flashSaleEnabled, flashSaleEnabled) ||
                other.flashSaleEnabled == flashSaleEnabled) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appName,
    logoUrl,
    darkLogoUrl,
    taxPercent,
    currency,
    deliveryRules,
    flashSaleEnabled,
    updatedAt,
  );

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      __$$AppSettingsModelImplCopyWithImpl<_$AppSettingsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsModelImplToJson(this);
  }
}

abstract class _AppSettingsModel implements AppSettingsModel {
  const factory _AppSettingsModel({
    final String appName,
    final String logoUrl,
    final String darkLogoUrl,
    final double taxPercent,
    final String currency,
    final DeliveryRules deliveryRules,
    final bool flashSaleEnabled,
    @TimestampConverter() final DateTime? updatedAt,
  }) = _$AppSettingsModelImpl;

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingsModelImpl.fromJson;

  @override
  String get appName;
  @override
  String get logoUrl;
  @override
  String get darkLogoUrl;
  @override
  double get taxPercent;
  @override
  String get currency;
  @override
  DeliveryRules get deliveryRules;
  @override
  bool get flashSaleEnabled;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
