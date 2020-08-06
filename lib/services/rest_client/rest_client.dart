import 'package:dio/dio.dart';
import 'package:fgmp_hm_4/models/album_model/album_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio networkService) = _RestClient;

  @GET('/album/{id}')
  Future<Album> one(@Path('id') String id);

  @GET('/albums')
  Future<List<Album>> all();
}
