// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WishlistModel _$WishlistModelFromJson(Map<String, dynamic> json) {
  return _WishlistModel.fromJson(json);
}

/// @nodoc
mixin _$WishlistModel {
  String get id => throw _privateConstructorUsedError;
  List<String> get productIds => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WishlistModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WishlistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishlistModelCopyWith<WishlistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistModelCopyWith<$Res> {
  factory $WishlistModelCopyWith(
    WishlistModel value,
    $Res Function(WishlistModel) then,
  ) = _$WishlistModelCopyWithImpl<$Res, WishlistModel>;
  @useResult
  $Res call({
    String id,
    List<String> productIds,
    @TimestampConverter() DateTime? updatedAt,
  });
}

/// @nodoc
class _$WishlistModelCopyWithImpl<$Res, $Val extends WishlistModel>
    implements $WishlistModelCopyWith<$Res> {
  _$WishlistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WishlistModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productIds = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            productIds: null == productIds
                ? _value.productIds
                : productIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WishlistModelImplCopyWith<$Res>
    implements $WishlistModelCopyWith<$Res> {
  factory _$$WishlistModelImplCopyWith(
    _$WishlistModelImpl value,
    $Res Function(_$WishlistModelImpl) then,
  ) = __$$WishlistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<String> productIds,
    @TimestampConverter() DateTime? updatedAt,
  });
}

/// @nodoc
class __$$WishlistModelImplCopyWithImpl<$Res>
    extends _$WishlistModelCopyWithImpl<$Res, _$WishlistModelImpl>
    implements _$$WishlistModelImplCopyWith<$Res> {
  __$$WishlistModelImplCopyWithImpl(
    _$WishlistModelImpl _value,
    $Res Function(_$WishlistModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WishlistModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productIds = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$WishlistModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productIds: null == productIds
            ? _value._productIds
            : productIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$WishlistModelImpl implements _WishlistModel {
  const _$WishlistModelImpl({
    required this.id,
    final List<String> productIds = const [],
    @TimestampConverter() this.updatedAt,
  }) : _productIds = productIds;

  factory _$WishlistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishlistModelImplFromJson(json);

  @override
  final String id;
  final List<String> _productIds;
  @override
  @JsonKey()
  List<String> get productIds {
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'WishlistModel(id: $id, productIds: $productIds, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishlistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._productIds,
              _productIds,
            ) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_productIds),
    updatedAt,
  );

  /// Create a copy of WishlistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishlistModelImplCopyWith<_$WishlistModelImpl> get copyWith =>
      __$$WishlistModelImplCopyWithImpl<_$WishlistModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishlistModelImplToJson(this);
  }
}

abstract class _WishlistModel implements WishlistModel {
  const factory _WishlistModel({
    required final String id,
    final List<String> productIds,
    @TimestampConverter() final DateTime? updatedAt,
  }) = _$WishlistModelImpl;

  factory _WishlistModel.fromJson(Map<String, dynamic> json) =
      _$WishlistModelImpl.fromJson;

  @override
  String get id;
  @override
  List<String> get productIds;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of WishlistModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishlistModelImplCopyWith<_$WishlistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
