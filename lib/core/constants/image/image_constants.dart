class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  /// example
  /// final example = 'example'.toPNG;

}

extension ImageConstantsExtension on String {
  String get toPNG => 'assets/image/$this.png';
}
