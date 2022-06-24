import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (text != null) Text(text.toString()),
            ElevatedButton(
                onPressed: () async {

                  String a = await bottomSheet();
                  print(a);
                },
                child: const Text("BottomSheet")),

            FutureBuilder(
              future: futureStringData(),
                builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                } else {
                  return Text(snapshot.data.toString());
                }
            })

          ],
        ),
      ),
    );
  }

  futureStringData() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'Hello';
  }

  bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 500,
            child: ElevatedButton(
              onPressed: () async {
                var a = await futureStringData();


              },
              child: const Text('aaaa'),
            ),
          );
        });
  }
}
