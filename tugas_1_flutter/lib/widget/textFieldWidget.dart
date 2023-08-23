import 'package:flutter/material.dart';
import 'package:tugas_1_flutter/utils/theme.dart';

class TextFieldWidget extends StatelessWidget {
    final String label;
  final TextEditingController controller;
  const TextFieldWidget({required this.controller,required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        padding: EdgeInsets.only(top: 5, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: controller,
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            
            labelText: label,
            labelStyle: whiteTextStyle.copyWith(
              fontWeight: semibold,
              fontSize: 20,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 4),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 4),
            ),
          ),
        ),
      ),
    );
  }
}
