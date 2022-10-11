// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RateModel _$RateModelFromJson(Map<String, dynamic> json) {
  return _RateModel.fromJson(json);
}

/// @nodoc
class _$RateModelTearOff {
  const _$RateModelTearOff();

  _RateModel call({required int rate, required int count}) {
    return _RateModel(
      rate: rate,
      count: count,
    );
  }

  RateModel fromJson(Map<String, Object?> json) {
    return RateModel.fromJson(json);
  }
}

/// @nodoc
const $RateModel = _$RateModelTearOff();

/// @nodoc
mixin _$RateModel {
  int get rate => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateModelCopyWith<RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateModelCopyWith<$Res> {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) then) =
      _$RateModelCopyWithImpl<$Res>;
  $Res call({int rate, int count});
}

/// @nodoc
class _$RateModelCopyWithImpl<$Res> implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._value, this._then);

  final RateModel _value;
  // ignore: unused_field
  final $Res Function(RateModel) _then;

  @override
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RateModelCopyWith<$Res> implements $RateModelCopyWith<$Res> {
  factory _$RateModelCopyWith(
          _RateModel value, $Res Function(_RateModel) then) =
      __$RateModelCopyWithImpl<$Res>;
  @override
  $Res call({int rate, int count});
}

/// @nodoc
class __$RateModelCopyWithImpl<$Res> extends _$RateModelCopyWithImpl<$Res>
    implements _$RateModelCopyWith<$Res> {
  __$RateModelCopyWithImpl(_RateModel _value, $Res Function(_RateModel) _then)
      : super(_value, (v) => _then(v as _RateModel));

  @override
  _RateModel get _value => super._value as _RateModel;

  @override
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RateModel(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateModel implements _RateModel {
  const _$_RateModel({required this.rate, required this.count});

  factory _$_RateModel.fromJson(Map<String, dynamic> json) =>
      _$$_RateModelFromJson(json);

  @override
  final int rate;
  @override
  final int count;

  @override
  String toString() {
    return 'RateModel(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateModel &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$RateModelCopyWith<_RateModel> get copyWith =>
      __$RateModelCopyWithImpl<_RateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateModelToJson(this);
  }
}

abstract class _RateModel implements RateModel {
  const factory _RateModel({required int rate, required int count}) =
      _$_RateModel;

  factory _RateModel.fromJson(Map<String, dynamic> json) =
      _$_RateModel.fromJson;

  @override
  int get rate;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$RateModelCopyWith<_RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
