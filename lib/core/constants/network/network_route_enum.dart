// ignore_for_file: constant_identifier_names

enum NetworkRoutes { DEFAULT, TEST }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.DEFAULT:
        return '';
      case NetworkRoutes.TEST:
        return 'public/registry/verify';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
