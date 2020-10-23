import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: "/v3")
abstract class NetworkService extends ChopperService {
  static NetworkService create(ChopperClient client) => _$NetworkService(client);

  @Get(path: "/c0bf47d1-dc34-4138-a260-d5a9677ea31e")
  Future<Response> getContents();
}