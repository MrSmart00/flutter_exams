import 'package:chopper/chopper.dart';

part 'content.chopper.dart';

@ChopperApi(baseUrl: "/v3")
abstract class ContentNetworkService extends ChopperService {
  @Get(path: "/e71ba3ef-0bfb-44c1-b9e8-25d35067d726")
  Future<Response> fetchContents();
}