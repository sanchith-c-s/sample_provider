import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/count_provider.dart';
class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final countProvider = Provider.of<CountProvider>(context,listen: false);
  //   Timer.periodic(Duration(seconds: 0),(timer){
  //     countProvider.setCount();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Center(
      child: Consumer<CountProvider>(builder: (context, value, child) {
        return Text(value.count.toString(),style: TextStyle(fontSize: 45),);
      },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}