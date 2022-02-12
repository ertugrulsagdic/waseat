import 'package:easy_localization/easy_localization.dart';
import 'package:kartal/kartal.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  bool get isValidEmail =>
      RegExp(RegexConstans.instance.emailRegex).hasMatch(this);

  bool get isValidEmails => RegExp(AppConstants.EMAIL_REGIEX).hasMatch(this);
}
