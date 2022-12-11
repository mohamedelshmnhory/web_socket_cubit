import 'package:json_annotation/json_annotation.dart';

part 'forget_response.g.dart';

@JsonSerializable()
class ForgetResponse {
  num? forget;
  String? msg_type;
  num? req_id;

  ForgetResponse({this.forget, this.msg_type, this.req_id});

  factory ForgetResponse.fromJson(Map<String, dynamic> json) => _$ForgetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);
}
