// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/facts/random?animal_type=cat")
  Future<FactResponse?> getFact();

  @Headers({"accept": "image/jpeg"})
  @GET("https://cataas.com/cat")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>?> getImage();
}

@JsonSerializable()
class FactResponse {
  @JsonKey(name: '_id')
  String? id;
  String? text;
  String? createdAt;

  FactResponse({this.id, this.text, this.createdAt});

  factory FactResponse.fromJson(Map<String, dynamic> json) =>
      _$FactResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FactResponseToJson(this);
}
