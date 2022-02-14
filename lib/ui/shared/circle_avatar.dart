import 'package:flutter/material.dart';

class PhotoFrame extends StatelessWidget {
  final String avatar;
  final double maxRadius;
  const PhotoFrame({Key? key, required this.avatar, required this.maxRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(avatar),
      maxRadius: maxRadius,
    );
  }
}
