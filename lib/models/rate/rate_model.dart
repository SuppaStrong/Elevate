import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/type_json_define.dart';

part 'rate_model.freezed.dart';
part 'rate_model.g.dart';

@freezed
class RateModel with _$RateModel  {
  const factory RateModel({
    required int rate,
    required int count,
  }) = _RateModel;
  factory RateModel.fromJson(JSON json) => _$RateModelFromJson(json);
}