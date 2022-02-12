class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;

  // bottomtab
  final footprint = 'footprint'.toSVG;
  final map = 'map'.toSVG;
  final gamification = 'gamification'.toSVG;
  final profile = 'profile'.toSVG;
  //map view
  final myLocation = 'my_location'.toSVG;
  final search = 'search'.toSVG;
  final check = 'check'.toSVG;
  // vehicles
  final walk = 'walk'.toSVG;
  final bike = 'bike'.toSVG;
  final car = 'car'.toSVG;
  final transportation = 'transportation'.toSVG;
  final bicycle = 'bicycle'.toSVG;
  final scooter = 'scooter'.toSVG;
  // find footprint
  final switchRoute = 'switch'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
