import 'package:envied/envied.dart';

part 'env_dev.g.dart';

/// Dev environment for api keys base url etc..
@Envied(
  obfuscate: true,
  path: 'assets/envied/.dev.env',
)
abstract class DevEnvironment {
  /// The base url we will request from. iOS side
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _DevEnvironment.baseUrl;
}
