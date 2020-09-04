
import 'package:flutter/foundation.dart';
import 'api_keys.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

abstract class API {
  String get apiKey;
  Uri tokenUri();
  Uri endpointUri(Endpoint endpoint);
}

class AdminAPI implements API {
  AdminAPI({@required this.apiKey});
  final String apiKey;

  factory AdminAPI.sandbox() => AdminAPI(apiKey: ApiKeys.adminSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri(
    scheme: 'https',
    host: host,
    path: 'token',
  );

  Uri endpointUri(Endpoint endpoint) => Uri(
    scheme: 'https',
    host: host,
    path: '${_paths[endpoint]}',
  );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}