import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: "/v3")
abstract class NetworkService extends ChopperService {
  static NetworkService create(ChopperClient client) => _$NetworkService(client);

  @Get(path: "/802d3b9b-0479-4fef-a9b9-d6f6726ac70e")
  Future<Response> getContents();
}