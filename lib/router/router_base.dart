import 'routes/routes.dart';
import 'package:shelf_router/shelf_router.dart';

Router buildRouter() {
  final router = Router();

  indexRouter(router);
  messageRouter(router);

  return router;
}
