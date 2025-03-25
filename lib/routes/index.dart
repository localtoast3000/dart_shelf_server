import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

void indexRouter(Router router) {
  router.get('/', () => Response.ok('Home route'));
}
