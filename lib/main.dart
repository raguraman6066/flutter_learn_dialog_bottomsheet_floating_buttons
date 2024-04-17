import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Dialog BottomSheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Simple Dialog"),
          children: [
            SimpleDialogOption(
              onPressed: () {},
              child: Text("Option 1"),
            ),
            SimpleDialogOption(
              child: Text("Option 2"),
            ),
            SimpleDialogOption(
              child: Text("Option 3"),
            ),
          ],
        );
      },
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //  color: Colors.green,
          ),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        alignment: Alignment.center,
        height: 200,
        width: double.infinity,
        child: Text("Entire page dialog"),
      ),
    );
  }

  _showMyDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("Title of Alert"),
            content: Text("Description of Alert"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.blue, width: 2.0),
                    bottom: BorderSide(color: Colors.green, width: 4.0),
                    left: BorderSide(color: Colors.red, width: 6.0),
                    right: BorderSide(color: Colors.yellow, width: 8.0),
                  ),
                ),
                child: Center(
                  child: Text('Hello, Flutter!'),
                ),
              ),
              ElevatedButton(
                  onPressed: _showMyDialog, child: Text("AlertDialog")),
              ElevatedButton(
                  onPressed: _showSimpleDialog, child: Text("SimpleDialog")),
              ElevatedButton(
                  onPressed: _showDialog, child: Text("CustomDialog")),
              ElevatedButton(
                  onPressed: _showBottomSheet, child: Text("BottomSheet")),
              SizedBox(
                height: 30,
              ),
              Text("buttons"),
              Container(
                // height: 200,
                // width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Elevated Button"),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.pink),
                  ),
                  /* style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                   minimumSize: Size(300, 100),
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(fontSize: 20),
                      shape: CircleBorder(side: BorderSide(color: Colors.red)),
                  //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                    elevation: 5
                  ),*/
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Text Button")),
              OutlinedButton(
                onPressed: () {},
                child: Text("Outlined Button"),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.pink,
                    side: BorderSide(color: Colors.yellow, width: 2)),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  label: Text("label"))
            ],
          ),
        ),
      ),
      // bottomSheet: Container(
      //   height: 50,
      //   color: Colors.green,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),label: "Home"
          ),BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),label: "Offers"
          )
        ],
      ),
      floatingActionButton: Container(
        //height: 100,width: 100,
        margin: EdgeInsets.only(top: 40),
        // child: FloatingActionButton.extended(
        //     onPressed: () {},
        //     icon: Icon(Icons.account_circle),
        //     label: Text("Demo user")),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: Icon(Icons.add),
          foregroundColor: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.orange,
          //mini: true,
        ),
      ),
    );
  }
}
