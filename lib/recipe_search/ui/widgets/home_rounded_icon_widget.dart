import 'package:flutter/material.dart';

class RoundedIconWidget extends StatelessWidget {
  const RoundedIconWidget(
      {required this.color, required this.icon, required this.title});

  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
