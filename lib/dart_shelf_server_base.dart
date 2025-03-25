import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf;
import 'router/router_base.dart';

void initDartShelfServer(String host, int port) async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(buildRouter().call);

  final server = await shelf.serve(handler, host, port);
  print('Server listening on http://${server.address.host}:${server.port}');
}
