import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> data = [];

  final title = TextEditingController();
  final amount = TextEditingController();

  add() {
    setState(() {
      data.add({
        "title": title.text,
        "amount": amount.text
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finance App")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            TextField(controller: title, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: amount, decoration: InputDecoration(labelText: "Amount")),

            ElevatedButton(
              onPressed: add,
              child: Text("Add"),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(data[i]["title"]),
                    subtitle: Text(data[i]["amount"]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
