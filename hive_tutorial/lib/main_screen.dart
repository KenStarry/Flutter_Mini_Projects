import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //  accessing our box
  final _myBox = Hive.box('myBox');

  //  write data
  void writeData() {
    _myBox.put(1, 'Starry');
  }

  //  read data
  void readData() {
    print(_myBox.get(1));
  }

  //  delete data
  void deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Tutorial"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: writeData,
                child: Text("Write"),
                color: Colors.greenAccent,
              ),
              MaterialButton(
                onPressed: readData,
                child: Text("Read"),
                color: Colors.orange,
              ),
              MaterialButton(
                onPressed: deleteData,
                child: Text("Write"),
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
