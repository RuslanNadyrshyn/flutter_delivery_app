import 'package:flutter/material.dart';

class FadeInImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const FadeInImageWidget(
      {Key? key,
        required this.image,
        required this.height,
        required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage.assetNetwork(
        image: image,
        height: height,
        width: width,
        placeholder: 'assets/place_holder.png',
      ),
    );
  }
}