import 'package:app_laundry/domain/entities/permissions/permissions.dart';
import 'package:flutter_plugin_pos_integration/export.dart';
import 'package:ideploy_package/ideploy_package.dart';
import 'package:permission_handler/permission_handler.dart';

@module
abstract class RegisterModule {
  Map<PermissionsType, Permission> get permissions =>
      <PermissionsType, Permission>{
        PermissionsType.bluetoothConnect: Permission.bluetoothConnect,
        PermissionsType.bluetoothScan: Permission.bluetoothScan,
        PermissionsType.location: Permission.location,
      };

  FlutterPluginPosIntegration get posPlugin => FlutterPluginPosIntegration();
}
