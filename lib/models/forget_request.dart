import 'package:json_annotation/json_annotation.dart';

part 'forget_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ForgetRequest {
  String forget;

  ForgetRequest({required this.forget});

  factory ForgetRequest.fromJson(Map<String, dynamic> json) => _$ForgetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetRequestToJson(this);
}
