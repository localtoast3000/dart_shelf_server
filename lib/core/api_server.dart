import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

class ApiServer {
  final String _name;
  final String _host;
  final int _port;
  final List<Middleware>? _middleware;
  final List<Function(Router)> _routers;

  ApiServer(
    this._name,
    this._host,
    this._port,
    this._middleware,
    this._routers,
  );

  get name => _name;
  get host => _host;
  get port => _port;

  Pipeline _appendMiddleware(Pipeline pipeline) {
    if (_middleware != null && _middleware.isNotEmpty) {
      for (final middleware in _middleware) {
        pipeline = pipeline.addMiddleware(middleware);
      }
    }

    return pipeline;
  }

  Router _buildRouter() {
    final apiRouter = Router();

    for (final router in _routers) {
      router(apiRouter);
    }

    return apiRouter;
  }

  FutureOr<Response> Function(Request) _buildPipeline() {
    return _appendMiddleware(Pipeline()).addHandler(_buildRouter().call);
  }

  void init() async {
    final server = await shelf.serve(_buildPipeline(), _host, _port);
    print(
      '$name server listening on http://${server.address.host}:${server.port}',
    );
  }
}
