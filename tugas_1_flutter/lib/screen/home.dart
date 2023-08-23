import 'package:flutter/material.dart';
import 'package:tugas_1_client/tugas_1_client.dart';
import 'package:tugas_1_flutter/main.dart';
import 'package:tugas_1_flutter/screen/doneScreen.dart';
import 'package:tugas_1_flutter/screen/loadingScreen.dart';
import 'package:tugas_1_flutter/screen/todoScreen.dart';
import 'package:tugas_1_flutter/utils/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        vsync: this, length: 2); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //AKHIR CODE BARU

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        appBar: AppBar(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: secondaryColor,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: Container(
              // padding: const EdgeInsets.only(bottom: 30.0),
              child: TabBar(
                  labelPadding: EdgeInsets.only(bottom: 30),
                  indicatorPadding: EdgeInsets.only(bottom: 30),
                  indicatorColor: greyColor2,
                  // indicatorWeight: 0.10,
                  controller: controller,
                  labelColor: Colors.white,
                  labelStyle: whiteTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 32),
                  unselectedLabelStyle:
                      greyTextStyle.copyWith(fontWeight: regular, fontSize: 32),
                  unselectedLabelColor: greyColor,
                  tabs: [
                    Tab(
                      child: Text(
                        "TODO",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "DONE",
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        body: TabBarView(controller: controller, children: <Widget>[
          TodoScreen(),
          DoneScreen(),
        ]),
        //END CODE
      
    );
  }

  
}
