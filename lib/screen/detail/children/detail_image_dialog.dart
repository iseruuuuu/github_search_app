import 'package:flutter/material.dart';

class DetailImageDialog extends StatelessWidget {
  const DetailImageDialog({
    Key? key,
    required this.avatarUrl,
  }) : super(key: key);

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          avatarUrl,
          width: deviceSize,
          height: deviceSize,
        ),
      ),
    );
  }
}
