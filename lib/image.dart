import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.57,
      child: Image.asset('myimages/Frame_28.png', fit: BoxFit.fill),
    );
  }
}
