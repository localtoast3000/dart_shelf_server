import 'package:dart_shelf_server/core/core.dart';
import 'package:dart_shelf_server/env.dart';
import 'package:dart_shelf_server/routes/routes.dart';
import 'package:shelf/shelf.dart';

ApiServer buildApi() {
  return ApiServer(
    Env.apiName,
    Env.apiHost,
    Env.apiPort,
    [logRequests()],
    [indexRouter, messageRouter],
  );
}
