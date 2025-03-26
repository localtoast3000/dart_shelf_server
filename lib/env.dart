import 'package:dotenv/dotenv.dart';

class Env {
  static final DotEnv _env = DotEnv(includePlatformEnvironment: true)..load();

  static final String apiName = _env['API_NAME'] ?? '';
  static final String apiHost = _env['API_HOST'] ?? '';
  static final int apiPort = int.tryParse(_env['API_PORT'] ?? '') ?? 0;
}
