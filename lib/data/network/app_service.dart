import 'package:dio/dio.dart';
import 'package:new_project/app/consts.dart';
import 'package:new_project/data/response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'app_service.g.dart';

@RestApi(baseUrl: Constanses.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @POST("/customer/login")
  Future<AuthinticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
