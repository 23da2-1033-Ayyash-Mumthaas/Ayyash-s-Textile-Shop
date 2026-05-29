// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeliveryRules _$DeliveryRulesFromJson(Map<String, dynamic> json) {
  return _DeliveryRules.fromJson(json);
}

/// @nodoc
mixin _$DeliveryRules {
  double get baseWeightKg => throw _privateConstructorUsedError;
  double get baseFee => throw _privateConstructorUsedError;
  double get extraPerKg => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this DeliveryRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryRulesCopyWith<DeliveryRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRulesCopyWith<$Res> {
  factory $DeliveryRulesCopyWith(
    DeliveryRules value,
    $Res Function(DeliveryRules) then,
  ) = _$DeliveryRulesCopyWithImpl<$Res, DeliveryRules>;
  @useResult
  $Res call({
    double baseWeightKg,
    double baseFee,
    double extraPerKg,
    String currency,
  });
}

/// @nodoc
class _$DeliveryRulesCopyWithImpl<$Res, $Val extends DeliveryRules>
    implements $DeliveryRulesCopyWith<$Res> {
  _$DeliveryRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseWeightKg = null,
    Object? baseFee = null,
    Object? extraPerKg = null,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            baseWeightKg: null == baseWeightKg
                ? _value.baseWeightKg
                : baseWeightKg // ignore: cast_nullable_to_non_nullable
                      as double,
            baseFee: null == baseFee
                ? _value.baseFee
                : baseFee // ignore: cast_nullable_to_non_nullable
                      as double,
            extraPerKg: null == extraPerKg
                ? _value.extraPerKg
                : extraPerKg // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryRulesImplCopyWith<$Res>
    implements $DeliveryRulesCopyWith<$Res> {
  factory _$$DeliveryRulesImplCopyWith(
    _$DeliveryRulesImpl value,
    $Res Function(_$DeliveryRulesImpl) then,
  ) = __$$DeliveryRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double baseWeightKg,
    double baseFee,
    double extraPerKg,
    String currency,
  });
}

/// @nodoc
class __$$DeliveryRulesImplCopyWithImpl<$Res>
    extends _$DeliveryRulesCopyWithImpl<$Res, _$DeliveryRulesImpl>
    implements _$$DeliveryRulesImplCopyWith<$Res> {
  __$$DeliveryRulesImplCopyWithImpl(
    _$DeliveryRulesImpl _value,
    $Res Function(_$DeliveryRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseWeightKg = null,
    Object? baseFee = null,
    Object? extraPerKg = null,
    Object? currency = null,
  }) {
    return _then(
      _$DeliveryRulesImpl(
        baseWeightKg: null == baseWeightKg
            ? _value.baseWeightKg
            : baseWeightKg // ignore: cast_nullable_to_non_nullable
                  as double,
        baseFee: null == baseFee
            ? _value.baseFee
            : baseFee // ignore: cast_nullable_to_non_nullable
                  as double,
        extraPerKg: null == extraPerKg
            ? _value.extraPerKg
            : extraPerKg // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryRulesImpl implements _DeliveryRules {
  const _$DeliveryRulesImpl({
    this.baseWeightKg = 1.0,
    this.baseFee = 450.0,
    this.extraPerKg = 150.0,
    this.currency = 'PKR',
  });

  factory _$DeliveryRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryRulesImplFromJson(json);

  @override
  @JsonKey()
  final double baseWeightKg;
  @override
  @JsonKey()
  final double baseFee;
  @override
  @JsonKey()
  final double extraPerKg;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'DeliveryRules(baseWeightKg: $baseWeightKg, baseFee: $baseFee, extraPerKg: $extraPerKg, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryRulesImpl &&
            (identical(other.baseWeightKg, baseWeightKg) ||
                other.baseWeightKg == baseWeightKg) &&
            (identical(other.baseFee, baseFee) || other.baseFee == baseFee) &&
            (identical(other.extraPerKg, extraPerKg) ||
                other.extraPerKg == extraPerKg) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseWeightKg, baseFee, extraPerKg, currency);

  /// Create a copy of DeliveryRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryRulesImplCopyWith<_$DeliveryRulesImpl> get copyWith =>
      __$$DeliveryRulesImplCopyWithImpl<_$DeliveryRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryRulesImplToJson(this);
  }
}

abstract class _DeliveryRules implements DeliveryRules {
  const factory _DeliveryRules({
    final double baseWeightKg,
    final double baseFee,
    final double extraPerKg,
    final String currency,
  }) = _$DeliveryRulesImpl;

  factory _DeliveryRules.fromJson(Map<String, dynamic> json) =
      _$DeliveryRulesImpl.fromJson;

  @override
  double get baseWeightKg;
  @override
  double get baseFee;
  @override
  double get extraPerKg;
  @override
  String get currency;

  /// Create a copy of DeliveryRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryRulesImplCopyWith<_$DeliveryRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
