import 'package:flutter/material.dart';

import './custom_circle_avatar.dart';

class CustomAvatarButton extends StatelessWidget {
  final Function() onPressed;
  final String imageUrl;
  final double? radius;
  final ShapeBorder? shape;

  const CustomAvatarButton({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
    this.radius,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: CustomCircleAvatar(
        imageUrl: imageUrl,
        radius: radius,
      ),
      shape: shape ?? const CircleBorder(),
    );
  }
}
