import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

void messageRouter(Router router) {
  router.get('/message', (Request req) => Response.ok('Hello route'));
}
