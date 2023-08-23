import 'package:flutter/material.dart';
import 'package:tugas_1_client/tugas_1_client.dart';
import 'package:tugas_1_flutter/main.dart';
import 'package:tugas_1_flutter/utils/theme.dart';
class CardWidget extends StatelessWidget {
  final Todo todo;
    final Function() onPressed;
  const CardWidget({super.key, required this.todo,required this.onPressed});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 8, left: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset:
                const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      // color: Color("oxffB3B7EE"),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 11, horizontal: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.judul,
                    style: whiteTextStyle.copyWith(
                        fontWeight: bold, fontSize: 24),
                  ),
                  Text(todo.keterangan,
                      style: whiteTextStyle.copyWith(fontSize: 16))
                ]),
                InkWell(
                  onTap: onPressed,
                  child: Container(
                    height: 45,
                    width: 45,
                    child: todo.kategori == "DONE" ? Image.asset("assets/done.png"):SizedBox(),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 3)
                      
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}