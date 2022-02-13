class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  /// example
  /// final example = 'example'.toPNG;

  final logoColored = 'logo_colored'.toPNG;
  final logoNameColored = 'logo_name_colored'.toPNG;
  final logoNameWhite = 'logo_name_white'.toPNG;
  final logoWhite = 'logo_white'.toPNG;
  final homeBackground = 'home_background'.toPNG;
  final background = 'background'.toPNG;
}

extension ImageConstantsExtension on String {
  String get toPNG => 'assets/image/$this.png';
}
