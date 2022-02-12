// ignore_for_file: constant_identifier_names

enum NetworkRoutes { DEFAULT, SEARCH_PLACE }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.DEFAULT:
        return '';
      case NetworkRoutes.SEARCH_PLACE:
        return 'public/registry/verify';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
