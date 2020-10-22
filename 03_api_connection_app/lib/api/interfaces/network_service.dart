import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: "/v3")
abstract class NetworkService extends ChopperService {
  static NetworkService create(ChopperClient client) => _$NetworkService(client);

  @Get(path: "/e71ba3ef-0bfb-44c1-b9e8-25d35067d726")
  Future<Response> getContents();
}