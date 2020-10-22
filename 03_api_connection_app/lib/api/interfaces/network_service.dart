import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: "/v3")
abstract class NetworkService extends ChopperService {
  static NetworkService create(ChopperClient client) => _$NetworkService(client);

  @Get(path: "/cad0b042-7b49-4daa-b75c-86472d58dbff")
  Future<Response> getContents();
}