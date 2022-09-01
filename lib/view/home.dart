import 'dart:async';
import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/loginsplash.dart';
import 'package:card_game/view/resultSplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import 'Widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textcont = Get.put(TextController());
  int player = 1;
  int wh = 1;
  bool buttondis = false;
  List cards = ["11", "111"];
  // List cards = [
  //   "11",
  //   "12",
  //   "13",
  //   "14",
  //   "15",
  //   "16",
  //   "17",
  //   "18",
  //   "19",
  //   "110",
  //   "111",
  //   "112",
  //   "113",
  //   "21",
  //   "22",
  //   "23",
  //   "24",
  //   "25",
  //   "26",
  //   "27",
  //   "28",
  //   "29",
  //   "210",
  //   "211",
  //   "212",
  //   "213",
  //   "31",
  //   "32",
  //   "33",
  //   "34",
  //   "35",
  //   "36",
  //   "37",
  //   "38",
  //   "39",
  //   "310",
  //   "311",
  //   "312",
  //   "313",
  //   "41",
  //   "42",
  //   "43",
  //   "44",
  //   "45",
  //   "46",
  //   "47",
  //   "48",
  //   "49",
  //   "410",
  //   "411",
  //   "412",
  //   "413"
  // ];
  @override
  void initState() {
    super.initState();
    // Navigator.push(context,  
    //         MaterialPageRoute(builder:  
    //             (context) => LoginSplash()  
    //         )  
    //      );
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 118, 7),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Profile(
                    name: "Me",
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          Obx(
                            () => Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    CardDisplay(value: textcont.player1.string)),
                          ),
                          Obx(() => Align(
                                alignment: Alignment.centerRight,
                                child:
                                    CardDisplay(value: textcont.player2.string),
                              )),
                          CardImage(),
                          Obx(
                            () => AnimatedOpacity(
                                opacity: textcont.visible2.isTrue ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 0),
                                child: AnimatedAlign(
                                    alignment: textcont.selected2.isTrue
                                        ? AlignmentDirectional.center
                                        : AlignmentDirectional.centerEnd,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: CardImage())),
                          ),
                          Obx(
                            () => AnimatedOpacity(
                                opacity: textcont.visible1.isTrue ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 0),
                                child: AnimatedAlign(
                                    alignment: textcont.selected1.isTrue
                                        ? AlignmentDirectional.center
                                        : AlignmentDirectional.centerStart,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: CardImage())),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Profile(name: "player2")
                ],
              ),
            ),
             
               InkWell(
                onTap: (() => textcont.buttondis.value
                        ? null
                        : {
                            textcont.buttondis.toggle(),
                            cardplay(),
                          }),
                 child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                                    "Deal",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
               ),
             
          ],
        ),
      ),
    );
  }

  cardplay() async {
    for (int i = 0; i < 52; i++) {
      Future.delayed(Duration(seconds: 1 + 5 * i), () {
        player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
      });
      Future.delayed(Duration(seconds: 2 + 5 * i), () {
        player == 1
            ? textcont.player1.value = cards[i]
            : textcont.player2.value = cards[i];
      });
      Future.delayed(Duration(seconds: 4 + 5 * i), () {
        player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
        player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
      });
      Future.delayed(Duration(seconds: 5 + 5 * i), () {
        player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
        if (cards[i].substring(1) == "11") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultSplash(result: player == 1 ? false : true)));
        }
        player = player == 1 ? 2 : 1;
      });
      if (cards[i].substring(1) == "11") {
        break;
      }
    }
  }
}
