import 'package:flutter/material.dart';

class WindowActionButton extends StatelessWidget {
  const WindowActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        roundContainerForIcons(Icons.remove),
        SizedBox(width: 15),
        roundContainerForIcons(Icons.crop_5_4_sharp),
        SizedBox(width: 15),
        roundContainerForIcons(Icons.close),
        SizedBox(width: 15),
      ],
    );
  }
}

Widget roundContainerForIcons(IconData icon) {
  return Container(
    height: 22,
    width: 22,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20)),
    child: Center(
        child: Icon(
      icon,
      size: 12,
      color: Colors.white,
    )),
  );
}
