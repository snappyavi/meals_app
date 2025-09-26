import 'package:flutter/cupertino.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 17, color: CupertinoColors.white, ),
        SizedBox(width: 6,),
        Text(label, style:const TextStyle(color: CupertinoColors.white, fontSize: 15),)
      ],
    );
  }
}
