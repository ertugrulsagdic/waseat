class SVGImageConstants {
  static SVGImageConstants? _instace;
  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();

  /// example
  /// final example = 'example'.toSVG;
}

extension SVGImageConstantsExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}
