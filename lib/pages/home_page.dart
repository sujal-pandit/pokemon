// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _pokemons = [];
  int index = Random().nextInt(150);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('resources/files/pokemondata.json');
    final data = await json.decode(response);
    setState(() {
      _pokemons = data["pokemons"];
      print("${_pokemons.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return _pokemons.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: 69,
              backgroundColor: Color.fromARGB(255, 52, 199, 104),
              title: Text("Pokemon Card Generator"),
              titleTextStyle: TextStyle(
                  fontSize: 29,
                  fontFamily: GoogleFonts.cabinSketch().fontFamily),
            ),
            body: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.network(
                    "${_pokemons[index]["image"]}",
                    height: 300,
                    width: 500,
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${_pokemons[index]["name"]}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 416,
                    child: VxArc(
                      height: 45,
                      arcType: VxArcType.CONVEY,
                      edge: VxEdge.TOP,
                      child: Container(
                        color: Color.fromARGB(255, 206, 210, 215),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
                                  child: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor:
                                        Color.fromARGB(255, 219, 238, 6),
                                    radius: 50,
                                    child: "HP \n ${_pokemons[index]["maxHP"]} "
                                        .text
                                        .xl2
                                        .bold
                                        .make(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                  child: SizedBox(
                                    height: 45.00,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        index = Random().nextInt(150);

                                        setState(() {});
                                      },
                                      child: "Generate".text.make(),
                                      clipBehavior: Clip.antiAlias,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 103, 70, 180))),
                                    ),
                                  ).py(0).px(35).pOnly(bottom: 40),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: CircleAvatar(
                                    foregroundColor:
                                        Color.fromARGB(255, 2, 11, 7),
                                    backgroundColor:
                                        Color.fromARGB(255, 227, 137, 98),
                                    radius: 50,
                                    child:
                                        "TYPE \n ${_pokemons[index]["types"][0]}"
                                            .text
                                            .xl2
                                            .bold
                                            .make(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                        height: 220,
                                        width: 150,
                                        color:
                                            Color.fromARGB(255, 212, 106, 106),
                                        child:
                                            "Weaknesses \n ${_pokemons[index]["weaknesses"]}"
                                                .text
                                                .xl
                                                .bold
                                                .make()
                                                .px(25))
                                    .px(32),
                                Container(
                                  height: 220,
                                  width: 160,
                                  color: Color.fromARGB(255, 102, 181, 166),
                                  child:
                                      "Resistance \n ${_pokemons[index]["resistant"]}"
                                          .text
                                          .xl
                                          .bold
                                          .make()
                                          .px(32),
                                ).pOnly(left: 40)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              toolbarHeight: 69,
              backgroundColor: Color.fromARGB(255, 52, 199, 104),
              title: Text("Pokemon Card Generator"),
              titleTextStyle: TextStyle(
                  fontSize: 29,
                  fontFamily: GoogleFonts.cabinSketch().fontFamily),
            ),
            body: Center(
                child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 70, width: 250),
              child: ElevatedButton(
                  onPressed: () {
                    readJson();
                    HomePage();
                  },
                  child: "Generate your pokemon".text.xl.make(),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      elevation: 25)),
            )));
  }
}
