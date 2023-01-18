import 'dart:math';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List l1 = [];
  List l2 = [];
  int i = 0, n = 0, b = 0;
  TextEditingController txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("OTP generator", style: TextStyle(fontSize: 25)),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            spreadRadius: 5,
                            offset: Offset(0, 10))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff9dabb9),
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextField(
                                controller: txt,
                                decoration: InputDecoration(
                                  labelText: "Enter the no",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.tealAccent),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            String a = txt.text;
                            n = int.parse(a);
                            l2.clear();
                            l1.clear();
                            setState(() {
                              var rnd = Random();
                              for (i = 0; i < n; i++) {
                                b = rnd.nextInt(9);
                                l2.add(b);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 125,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(8),
                                // border: Border.all(
                                //     color: Colors.blue.shade700, width: 2),
                              ),
                              child: Text("Creat",
                                  style: TextStyle(
                                      color: Color(0xff8bbdb4), fontSize: 25)),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: l2
                                .asMap()
                                .entries
                                .map((e) => Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                child: Text(
                                  "${l2[e.key]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25),
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            String a = txt.text;
                            n = int.parse(a);
                            l2.clear();
                            l1.clear();
                            setState(() {
                              var rnd = Random();
                              for (i = 0; i < n; i++) {
                                b = rnd.nextInt(9);
                                l2.remove(b);
                                Text("$l2");
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 125,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(8),
                                // border: Border.all(
                                //     color: Colors.blue.shade700, width: 2),
                              ),
                              child: Text("Reset",
                                  style: TextStyle(
                                      color: Color(0xff8bbdb4), fontSize: 25)),
                            ),
                          ),
                        ),
                      ],
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
}