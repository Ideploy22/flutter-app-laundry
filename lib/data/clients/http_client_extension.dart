import 'package:ideploy_package/ideploy_package.dart';

extension HttpResponseExtension on Response<dynamic> {
  bool get isUnauthorized => statusCode == 401 || statusCode == 403;

  bool get authMessageError => isUnauthorized && data['cause'] == 'client_not_authorized_certificate';
}
