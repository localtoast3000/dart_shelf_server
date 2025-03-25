import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

void indexRouter(Router router) {
  router.get('/', (Request req) => Response.ok('Home route'));
}
