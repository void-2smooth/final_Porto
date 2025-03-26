import 'package:flutter/material.dart';

class ImageBellowHeadline extends StatelessWidget {
  const ImageBellowHeadline({super.key});

  final double imageheight = 500;
  final double imagewidth = 500;

  final String imageAsset = 'assets/images/Mobileappdeveloper.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageAsset, width: imagewidth, height: imageheight);
  }
}
