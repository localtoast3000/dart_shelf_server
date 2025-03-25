import 'package:dart_shelf_server/core/core.dart';
import 'package:dart_shelf_server/routes/routes.dart';
import 'package:shelf/shelf.dart';

const _apiName = "dart_shelf";
const _host = 'localhost';
const _port = 8080;

ApiServer buildApi() {
  return ApiServer(
    _apiName,
    _host,
    _port,
    [logRequests()],
    [indexRouter, messageRouter],
  );
}
