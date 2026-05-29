// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderLineItem _$OrderLineItemFromJson(Map<String, dynamic> json) {
  return _OrderLineItem.fromJson(json);
}

/// @nodoc
mixin _$OrderLineItem {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get lineTotal => throw _privateConstructorUsedError;

  /// Serializes this OrderLineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLineItemCopyWith<OrderLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineItemCopyWith<$Res> {
  factory $OrderLineItemCopyWith(
    OrderLineItem value,
    $Res Function(OrderLineItem) then,
  ) = _$OrderLineItemCopyWithImpl<$Res, OrderLineItem>;
  @useResult
  $Res call({
    String productId,
    String name,
    String imageUrl,
    String size,
    String color,
    int quantity,
    double unitPrice,
    double lineTotal,
  });
}

/// @nodoc
class _$OrderLineItemCopyWithImpl<$Res, $Val extends OrderLineItem>
    implements $OrderLineItemCopyWith<$Res> {
  _$OrderLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? lineTotal = null,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitPrice: null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            lineTotal: null == lineTotal
                ? _value.lineTotal
                : lineTotal // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderLineItemImplCopyWith<$Res>
    implements $OrderLineItemCopyWith<$Res> {
  factory _$$OrderLineItemImplCopyWith(
    _$OrderLineItemImpl value,
    $Res Function(_$OrderLineItemImpl) then,
  ) = __$$OrderLineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String productId,
    String name,
    String imageUrl,
    String size,
    String color,
    int quantity,
    double unitPrice,
    double lineTotal,
  });
}

/// @nodoc
class __$$OrderLineItemImplCopyWithImpl<$Res>
    extends _$OrderLineItemCopyWithImpl<$Res, _$OrderLineItemImpl>
    implements _$$OrderLineItemImplCopyWith<$Res> {
  __$$OrderLineItemImplCopyWithImpl(
    _$OrderLineItemImpl _value,
    $Res Function(_$OrderLineItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? size = null,
    Object? color = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? lineTotal = null,
  }) {
    return _then(
      _$OrderLineItemImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _value.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        lineTotal: null == lineTotal
            ? _value.lineTotal
            : lineTotal // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineItemImpl extends _OrderLineItem {
  const _$OrderLineItemImpl({
    required this.productId,
    this.name = '',
    this.imageUrl = '',
    this.size = '',
    this.color = '',
    this.quantity = 1,
    this.unitPrice = 0.0,
    this.lineTotal = 0.0,
  }) : super._();

  factory _$OrderLineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineItemImplFromJson(json);

  @override
  final String productId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String size;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double unitPrice;
  @override
  @JsonKey()
  final double lineTotal;

  @override
  String toString() {
    return 'OrderLineItem(productId: $productId, name: $name, imageUrl: $imageUrl, size: $size, color: $color, quantity: $quantity, unitPrice: $unitPrice, lineTotal: $lineTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    name,
    imageUrl,
    size,
    color,
    quantity,
    unitPrice,
    lineTotal,
  );

  /// Create a copy of OrderLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineItemImplCopyWith<_$OrderLineItemImpl> get copyWith =>
      __$$OrderLineItemImplCopyWithImpl<_$OrderLineItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineItemImplToJson(this);
  }
}

abstract class _OrderLineItem extends OrderLineItem {
  const factory _OrderLineItem({
    required final String productId,
    final String name,
    final String imageUrl,
    final String size,
    final String color,
    final int quantity,
    final double unitPrice,
    final double lineTotal,
  }) = _$OrderLineItemImpl;
  const _OrderLineItem._() : super._();

  factory _OrderLineItem.fromJson(Map<String, dynamic> json) =
      _$OrderLineItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get size;
  @override
  String get color;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  double get lineTotal;

  /// Create a copy of OrderLineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLineItemImplCopyWith<_$OrderLineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTimelineEntry _$OrderTimelineEntryFromJson(Map<String, dynamic> json) {
  return _OrderTimelineEntry.fromJson(json);
}

/// @nodoc
mixin _$OrderTimelineEntry {
  @OrderStatusConverter()
  OrderStatus get status => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get at => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this OrderTimelineEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTimelineEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTimelineEntryCopyWith<OrderTimelineEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTimelineEntryCopyWith<$Res> {
  factory $OrderTimelineEntryCopyWith(
    OrderTimelineEntry value,
    $Res Function(OrderTimelineEntry) then,
  ) = _$OrderTimelineEntryCopyWithImpl<$Res, OrderTimelineEntry>;
  @useResult
  $Res call({
    @OrderStatusConverter() OrderStatus status,
    @TimestampConverter() DateTime? at,
    String note,
  });
}

/// @nodoc
class _$OrderTimelineEntryCopyWithImpl<$Res, $Val extends OrderTimelineEntry>
    implements $OrderTimelineEntryCopyWith<$Res> {
  _$OrderTimelineEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTimelineEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? at = freezed,
    Object? note = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OrderStatus,
            at: freezed == at
                ? _value.at
                : at // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderTimelineEntryImplCopyWith<$Res>
    implements $OrderTimelineEntryCopyWith<$Res> {
  factory _$$OrderTimelineEntryImplCopyWith(
    _$OrderTimelineEntryImpl value,
    $Res Function(_$OrderTimelineEntryImpl) then,
  ) = __$$OrderTimelineEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @OrderStatusConverter() OrderStatus status,
    @TimestampConverter() DateTime? at,
    String note,
  });
}

/// @nodoc
class __$$OrderTimelineEntryImplCopyWithImpl<$Res>
    extends _$OrderTimelineEntryCopyWithImpl<$Res, _$OrderTimelineEntryImpl>
    implements _$$OrderTimelineEntryImplCopyWith<$Res> {
  __$$OrderTimelineEntryImplCopyWithImpl(
    _$OrderTimelineEntryImpl _value,
    $Res Function(_$OrderTimelineEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderTimelineEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? at = freezed,
    Object? note = null,
  }) {
    return _then(
      _$OrderTimelineEntryImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrderStatus,
        at: freezed == at
            ? _value.at
            : at // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTimelineEntryImpl implements _OrderTimelineEntry {
  const _$OrderTimelineEntryImpl({
    @OrderStatusConverter() this.status = OrderStatus.placed,
    @TimestampConverter() this.at,
    this.note = '',
  });

  factory _$OrderTimelineEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTimelineEntryImplFromJson(json);

  @override
  @JsonKey()
  @OrderStatusConverter()
  final OrderStatus status;
  @override
  @TimestampConverter()
  final DateTime? at;
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'OrderTimelineEntry(status: $status, at: $at, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTimelineEntryImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, at, note);

  /// Create a copy of OrderTimelineEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTimelineEntryImplCopyWith<_$OrderTimelineEntryImpl> get copyWith =>
      __$$OrderTimelineEntryImplCopyWithImpl<_$OrderTimelineEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTimelineEntryImplToJson(this);
  }
}

abstract class _OrderTimelineEntry implements OrderTimelineEntry {
  const factory _OrderTimelineEntry({
    @OrderStatusConverter() final OrderStatus status,
    @TimestampConverter() final DateTime? at,
    final String note,
  }) = _$OrderTimelineEntryImpl;

  factory _OrderTimelineEntry.fromJson(Map<String, dynamic> json) =
      _$OrderTimelineEntryImpl.fromJson;

  @override
  @OrderStatusConverter()
  OrderStatus get status;
  @override
  @TimestampConverter()
  DateTime? get at;
  @override
  String get note;

  /// Create a copy of OrderTimelineEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTimelineEntryImplCopyWith<_$OrderTimelineEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryAddressSnapshot _$DeliveryAddressSnapshotFromJson(
  Map<String, dynamic> json,
) {
  return _DeliveryAddressSnapshot.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddressSnapshot {
  String get line1 => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this DeliveryAddressSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryAddressSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryAddressSnapshotCopyWith<DeliveryAddressSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressSnapshotCopyWith<$Res> {
  factory $DeliveryAddressSnapshotCopyWith(
    DeliveryAddressSnapshot value,
    $Res Function(DeliveryAddressSnapshot) then,
  ) = _$DeliveryAddressSnapshotCopyWithImpl<$Res, DeliveryAddressSnapshot>;
  @useResult
  $Res call({String line1, String city, String phone});
}

/// @nodoc
class _$DeliveryAddressSnapshotCopyWithImpl<
  $Res,
  $Val extends DeliveryAddressSnapshot
>
    implements $DeliveryAddressSnapshotCopyWith<$Res> {
  _$DeliveryAddressSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryAddressSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? line1 = null, Object? city = null, Object? phone = null}) {
    return _then(
      _value.copyWith(
            line1: null == line1
                ? _value.line1
                : line1 // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryAddressSnapshotImplCopyWith<$Res>
    implements $DeliveryAddressSnapshotCopyWith<$Res> {
  factory _$$DeliveryAddressSnapshotImplCopyWith(
    _$DeliveryAddressSnapshotImpl value,
    $Res Function(_$DeliveryAddressSnapshotImpl) then,
  ) = __$$DeliveryAddressSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String line1, String city, String phone});
}

/// @nodoc
class __$$DeliveryAddressSnapshotImplCopyWithImpl<$Res>
    extends
        _$DeliveryAddressSnapshotCopyWithImpl<
          $Res,
          _$DeliveryAddressSnapshotImpl
        >
    implements _$$DeliveryAddressSnapshotImplCopyWith<$Res> {
  __$$DeliveryAddressSnapshotImplCopyWithImpl(
    _$DeliveryAddressSnapshotImpl _value,
    $Res Function(_$DeliveryAddressSnapshotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryAddressSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? line1 = null, Object? city = null, Object? phone = null}) {
    return _then(
      _$DeliveryAddressSnapshotImpl(
        line1: null == line1
            ? _value.line1
            : line1 // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressSnapshotImpl implements _DeliveryAddressSnapshot {
  const _$DeliveryAddressSnapshotImpl({
    this.line1 = '',
    this.city = '',
    this.phone = '',
  });

  factory _$DeliveryAddressSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressSnapshotImplFromJson(json);

  @override
  @JsonKey()
  final String line1;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String phone;

  @override
  String toString() {
    return 'DeliveryAddressSnapshot(line1: $line1, city: $city, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressSnapshotImpl &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, line1, city, phone);

  /// Create a copy of DeliveryAddressSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressSnapshotImplCopyWith<_$DeliveryAddressSnapshotImpl>
  get copyWith =>
      __$$DeliveryAddressSnapshotImplCopyWithImpl<
        _$DeliveryAddressSnapshotImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressSnapshotImplToJson(this);
  }
}

abstract class _DeliveryAddressSnapshot implements DeliveryAddressSnapshot {
  const factory _DeliveryAddressSnapshot({
    final String line1,
    final String city,
    final String phone,
  }) = _$DeliveryAddressSnapshotImpl;

  factory _DeliveryAddressSnapshot.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressSnapshotImpl.fromJson;

  @override
  String get line1;
  @override
  String get city;
  @override
  String get phone;

  /// Create a copy of DeliveryAddressSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryAddressSnapshotImplCopyWith<_$DeliveryAddressSnapshotImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<OrderLineItem> get items => throw _privateConstructorUsedError;
  @OrderStatusConverter()
  OrderStatus get status => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  DeliveryAddressSnapshot get deliveryAddress =>
      throw _privateConstructorUsedError;
  List<OrderTimelineEntry> get timeline => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get placedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    List<OrderLineItem> items,
    @OrderStatusConverter() OrderStatus status,
    String paymentMethod,
    double subtotal,
    double discount,
    double tax,
    double deliveryFee,
    double total,
    String couponCode,
    DeliveryAddressSnapshot deliveryAddress,
    List<OrderTimelineEntry> timeline,
    @TimestampConverter() DateTime? placedAt,
    @TimestampConverter() DateTime? updatedAt,
  });

  $DeliveryAddressSnapshotCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? items = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? deliveryFee = null,
    Object? total = null,
    Object? couponCode = null,
    Object? deliveryAddress = null,
    Object? timeline = null,
    Object? placedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderLineItem>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OrderStatus,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            tax: null == tax
                ? _value.tax
                : tax // ignore: cast_nullable_to_non_nullable
                      as double,
            deliveryFee: null == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            couponCode: null == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryAddress: null == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as DeliveryAddressSnapshot,
            timeline: null == timeline
                ? _value.timeline
                : timeline // ignore: cast_nullable_to_non_nullable
                      as List<OrderTimelineEntry>,
            placedAt: freezed == placedAt
                ? _value.placedAt
                : placedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressSnapshotCopyWith<$Res> get deliveryAddress {
    return $DeliveryAddressSnapshotCopyWith<$Res>(_value.deliveryAddress, (
      value,
    ) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    List<OrderLineItem> items,
    @OrderStatusConverter() OrderStatus status,
    String paymentMethod,
    double subtotal,
    double discount,
    double tax,
    double deliveryFee,
    double total,
    String couponCode,
    DeliveryAddressSnapshot deliveryAddress,
    List<OrderTimelineEntry> timeline,
    @TimestampConverter() DateTime? placedAt,
    @TimestampConverter() DateTime? updatedAt,
  });

  @override
  $DeliveryAddressSnapshotCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? items = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? deliveryFee = null,
    Object? total = null,
    Object? couponCode = null,
    Object? deliveryAddress = null,
    Object? timeline = null,
    Object? placedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$OrderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderLineItem>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrderStatus,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        tax: null == tax
            ? _value.tax
            : tax // ignore: cast_nullable_to_non_nullable
                  as double,
        deliveryFee: null == deliveryFee
            ? _value.deliveryFee
            : deliveryFee // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        couponCode: null == couponCode
            ? _value.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryAddress: null == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as DeliveryAddressSnapshot,
        timeline: null == timeline
            ? _value._timeline
            : timeline // ignore: cast_nullable_to_non_nullable
                  as List<OrderTimelineEntry>,
        placedAt: freezed == placedAt
            ? _value.placedAt
            : placedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl({
    required this.id,
    required this.userId,
    final List<OrderLineItem> items = const [],
    @OrderStatusConverter() this.status = OrderStatus.placed,
    this.paymentMethod = 'cod',
    this.subtotal = 0.0,
    this.discount = 0.0,
    this.tax = 0.0,
    this.deliveryFee = 0.0,
    this.total = 0.0,
    this.couponCode = '',
    this.deliveryAddress = const DeliveryAddressSnapshot(),
    final List<OrderTimelineEntry> timeline = const [],
    @TimestampConverter() this.placedAt,
    @TimestampConverter() this.updatedAt,
  }) : _items = items,
       _timeline = timeline,
       super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<OrderLineItem> _items;
  @override
  @JsonKey()
  List<OrderLineItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  @OrderStatusConverter()
  final OrderStatus status;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final DeliveryAddressSnapshot deliveryAddress;
  final List<OrderTimelineEntry> _timeline;
  @override
  @JsonKey()
  List<OrderTimelineEntry> get timeline {
    if (_timeline is EqualUnmodifiableListView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeline);
  }

  @override
  @TimestampConverter()
  final DateTime? placedAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, items: $items, status: $status, paymentMethod: $paymentMethod, subtotal: $subtotal, discount: $discount, tax: $tax, deliveryFee: $deliveryFee, total: $total, couponCode: $couponCode, deliveryAddress: $deliveryAddress, timeline: $timeline, placedAt: $placedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline) &&
            (identical(other.placedAt, placedAt) ||
                other.placedAt == placedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    const DeepCollectionEquality().hash(_items),
    status,
    paymentMethod,
    subtotal,
    discount,
    tax,
    deliveryFee,
    total,
    couponCode,
    deliveryAddress,
    const DeepCollectionEquality().hash(_timeline),
    placedAt,
    updatedAt,
  );

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel({
    required final String id,
    required final String userId,
    final List<OrderLineItem> items,
    @OrderStatusConverter() final OrderStatus status,
    final String paymentMethod,
    final double subtotal,
    final double discount,
    final double tax,
    final double deliveryFee,
    final double total,
    final String couponCode,
    final DeliveryAddressSnapshot deliveryAddress,
    final List<OrderTimelineEntry> timeline,
    @TimestampConverter() final DateTime? placedAt,
    @TimestampConverter() final DateTime? updatedAt,
  }) = _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<OrderLineItem> get items;
  @override
  @OrderStatusConverter()
  OrderStatus get status;
  @override
  String get paymentMethod;
  @override
  double get subtotal;
  @override
  double get discount;
  @override
  double get tax;
  @override
  double get deliveryFee;
  @override
  double get total;
  @override
  String get couponCode;
  @override
  DeliveryAddressSnapshot get deliveryAddress;
  @override
  List<OrderTimelineEntry> get timeline;
  @override
  @TimestampConverter()
  DateTime? get placedAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
