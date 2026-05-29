// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @OfferTypeConverter()
  OfferType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  double get minOrderAmount => throw _privateConstructorUsedError;
  double get maxDiscount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get startsAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get endsAt => throw _privateConstructorUsedError;

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
    OfferModel value,
    $Res Function(OfferModel) then,
  ) = _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call({
    String id,
    String title,
    @OfferTypeConverter() OfferType type,
    double value,
    String couponCode,
    String categoryId,
    String productId,
    double minOrderAmount,
    double maxDiscount,
    bool isActive,
    @TimestampConverter() DateTime? startsAt,
    @TimestampConverter() DateTime? endsAt,
  });
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? value = null,
    Object? couponCode = null,
    Object? categoryId = null,
    Object? productId = null,
    Object? minOrderAmount = null,
    Object? maxDiscount = null,
    Object? isActive = null,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as OfferType,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            couponCode: null == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String,
            minOrderAmount: null == minOrderAmount
                ? _value.minOrderAmount
                : minOrderAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            maxDiscount: null == maxDiscount
                ? _value.maxDiscount
                : maxDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            startsAt: freezed == startsAt
                ? _value.startsAt
                : startsAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endsAt: freezed == endsAt
                ? _value.endsAt
                : endsAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
    _$OfferModelImpl value,
    $Res Function(_$OfferModelImpl) then,
  ) = __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    @OfferTypeConverter() OfferType type,
    double value,
    String couponCode,
    String categoryId,
    String productId,
    double minOrderAmount,
    double maxDiscount,
    bool isActive,
    @TimestampConverter() DateTime? startsAt,
    @TimestampConverter() DateTime? endsAt,
  });
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
    _$OfferModelImpl _value,
    $Res Function(_$OfferModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? value = null,
    Object? couponCode = null,
    Object? categoryId = null,
    Object? productId = null,
    Object? minOrderAmount = null,
    Object? maxDiscount = null,
    Object? isActive = null,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(
      _$OfferModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as OfferType,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        couponCode: null == couponCode
            ? _value.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        minOrderAmount: null == minOrderAmount
            ? _value.minOrderAmount
            : minOrderAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        maxDiscount: null == maxDiscount
            ? _value.maxDiscount
            : maxDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        startsAt: freezed == startsAt
            ? _value.startsAt
            : startsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endsAt: freezed == endsAt
            ? _value.endsAt
            : endsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl implements _OfferModel {
  const _$OfferModelImpl({
    required this.id,
    this.title = '',
    @OfferTypeConverter() this.type = OfferType.percentage,
    this.value = 0.0,
    this.couponCode = '',
    this.categoryId = '',
    this.productId = '',
    this.minOrderAmount = 0.0,
    this.maxDiscount = 0.0,
    this.isActive = true,
    @TimestampConverter() this.startsAt,
    @TimestampConverter() this.endsAt,
  });

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  @OfferTypeConverter()
  final OfferType type;
  @override
  @JsonKey()
  final double value;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final String categoryId;
  @override
  @JsonKey()
  final String productId;
  @override
  @JsonKey()
  final double minOrderAmount;
  @override
  @JsonKey()
  final double maxDiscount;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @TimestampConverter()
  final DateTime? startsAt;
  @override
  @TimestampConverter()
  final DateTime? endsAt;

  @override
  String toString() {
    return 'OfferModel(id: $id, title: $title, type: $type, value: $value, couponCode: $couponCode, categoryId: $categoryId, productId: $productId, minOrderAmount: $minOrderAmount, maxDiscount: $maxDiscount, isActive: $isActive, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.minOrderAmount, minOrderAmount) ||
                other.minOrderAmount == minOrderAmount) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    type,
    value,
    couponCode,
    categoryId,
    productId,
    minOrderAmount,
    maxDiscount,
    isActive,
    startsAt,
    endsAt,
  );

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(this);
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel({
    required final String id,
    final String title,
    @OfferTypeConverter() final OfferType type,
    final double value,
    final String couponCode,
    final String categoryId,
    final String productId,
    final double minOrderAmount,
    final double maxDiscount,
    final bool isActive,
    @TimestampConverter() final DateTime? startsAt,
    @TimestampConverter() final DateTime? endsAt,
  }) = _$OfferModelImpl;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @OfferTypeConverter()
  OfferType get type;
  @override
  double get value;
  @override
  String get couponCode;
  @override
  String get categoryId;
  @override
  String get productId;
  @override
  double get minOrderAmount;
  @override
  double get maxDiscount;
  @override
  bool get isActive;
  @override
  @TimestampConverter()
  DateTime? get startsAt;
  @override
  @TimestampConverter()
  DateTime? get endsAt;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
