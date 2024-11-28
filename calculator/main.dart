import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var sum = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),),
        backgroundColor: Colors.grey,
      ),
      body:
      Container(
        color: Colors.black54,
        child:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter first number",
                    hintText: "Enter number only",
                    prefixIcon: Icon(Icons.numbers),
                    labelStyle: TextStyle(color:Colors.white , fontWeight: FontWeight.bold , fontSize: 15)
                  ),
                  keyboardType: TextInputType.number,
                  controller: no1Controller,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter second number",
                    hintText: "Enter number only",
                    prefixIcon: Icon(Icons.numbers),
                    labelStyle: TextStyle(color:Colors.white , fontWeight: FontWeight.bold , fontSize: 15)
                  ),
                  keyboardType: TextInputType.number,
                  controller: no2Controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          var result = int.parse(no1Controller.text.toString()) + int.parse(no2Controller.text.toString());
                          sum = "The final ans is $result";
                          print(result);
                        });
                      }, child: Text("Add")),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          var result = int.parse(no1Controller.text.toString()) - int.parse(no2Controller.text.toString());
                          sum = "The final ans is $result";
                          print(result);
                        });
                      }, child: Text("Sub")),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          var result = int.parse(no1Controller.text.toString()) * int.parse(no2Controller.text.toString());
                          sum = "The final ans is $result";
                          print(result);
                        });}, child: Text("Mul")),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          var result = int.parse(no1Controller.text.toString()) / int.parse(no2Controller.text.toString());
                          sum = "The final ans is ${result.toStringAsFixed(7)}";
                          print(result);
                        });}, child: Text("Div")),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(21) , child: Text("Result : $sum" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),)
              ],
            ),
          ),
        ),
      )
    );
  }

}