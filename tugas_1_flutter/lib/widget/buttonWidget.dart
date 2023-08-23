import 'package:flutter/material.dart';
import 'package:tugas_1_flutter/utils/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
      final Function() onPressed;
  const ButtonWidget({required this.onPressed,required this.text,this.color = Colors.white, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
                  // width: double.infinity,
                  height: 82,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text(text,style: text == "DELETE" ? whiteTextStyle.copyWith(
                    fontSize: 24,fontWeight: semibold
                  ):greyTextStyle2.copyWith(
                    fontSize: 24,
                    fontWeight: semibold
                  ),)),
                ),
    );
  }
}