import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_provider/providers/CountProvider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // yahan pr agar hum (listen: true) kr denge to error
    //throw kr dega qki bina widget build kiye hum access krne ki kosis kr rhe hote hain
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 5), (timer) {
      countProvider.updateCount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // yahan pr agr (listen: false) nhi krenge to ye
    // exactly setState ki trh hi build ko call kr dega
    
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build ${countProvider.getCount()}");
    return Scaffold(
      appBar: AppBar(title: Text("Provider Count Example"), centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(border: Border.all()),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Count of button pressed is ",
                  style: TextStyle(fontSize: 25)),
              SizedBox(height: 5),
              Consumer<CountProvider>(builder: (context, value, child) {
                return Text("${value.count}",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
              })
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          countProvider.updateCount();
        },
      ),
    );
  }
}
