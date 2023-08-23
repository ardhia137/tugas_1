import "package:flutter/material.dart";
import "package:tugas_1_client/tugas_1_client.dart";
import "package:tugas_1_flutter/main.dart";
import "package:tugas_1_flutter/utils/theme.dart";
import "package:tugas_1_flutter/widget/buttonWidget.dart";
import "package:tugas_1_flutter/widget/textFieldWidget.dart";

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
   final TextEditingController judulController =
      TextEditingController(text: '');
     final TextEditingController keteranganController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: secondaryColor,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 40),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 25, right: 50),
            child: Row(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.white,
                    )),
                Spacer(),
                Center(
                  child: Text(
                    "ADD TODO",
                    style:
                        whiteTextStyle.copyWith(fontSize: 36, fontWeight: bold),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            shrinkWrap: true,
            children: [
              TextFieldWidget(controller: judulController,label: "TODO TITLE",),
              SizedBox(height: 25,),
              TextFieldWidget(controller: keteranganController,label: "TODO SUB TITLE",),
              SizedBox(height: 30,),
              ButtonWidget(
                text: "ADD TODO",
                onPressed: () async{
                  if (judulController.text != "" && keteranganController.text != "") {
                    final todo = Todo(
                  kategori: "TODO",
                  judul: judulController.text,
                  keterangan: keteranganController.text);
                  await client.todo.create(todo);
                  Navigator.popAndPushNamed(context, '/');
                  }else{
                       const snackBar = SnackBar(
                      content: Text('Harap Isi Data Dengan Benar'),
                      backgroundColor: (Colors.red),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
