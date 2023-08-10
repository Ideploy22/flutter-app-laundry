import 'package:ideploy_package/ideploy_package.dart';

part 'configuration_controller.g.dart';

@injectable
class ConfigurationController = _ConfigurationControllerBase
    with _$ConfigurationController;

abstract class _ConfigurationControllerBase with Store {}
