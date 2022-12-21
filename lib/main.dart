import 'package:amr_controller_flutter/josy_stick.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: JoyStickPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:roslib/roslib.dart';

// void main() {
//   runApp(ExampleApp());
// }

// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Roslib Example',
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Ros ros;
//   late Topic chatter;

//   @override
//   void initState() {
//     ros = Ros(url: 'ws://192.168.29.179:9090');
//     chatter = Topic(
//         ros: ros,
//         name: '/chatter',
//         type: "std_msgs/String",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     super.initState();
//   }

//   void initConnection() async {
//     ros.connect();
//     await chatter.subscribe();
//     setState(() {});
//   }

//   void destroyConnection() async {
//     await chatter.unsubscribe();
//     await ros.close();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Roslib Example'),
//       ),
//       body: StreamBuilder<Object>(
//           stream: ros.statusStream,
//           builder: (context, snapshot) {
//             return Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   StreamBuilder(
//                     stream: chatter.subscription,
//                     builder: (context2, snapshot2) {
//                       if (snapshot2.hasData) {
//                         return Text('yhghghg');
//                       } else {
//                         return CircularProgressIndicator();
//                       }
//                     },
//                   ),
//                   ActionChip(
//                     label: Text(snapshot.data == Status.CONNECTED
//                         ? 'DISCONNECT'
//                         : 'CONNECT'),
//                     backgroundColor: snapshot.data == Status.CONNECTED
//                         ? Colors.green[300]
//                         : Colors.grey[300],
//                     onPressed: () {
//                       print(snapshot.data);
//                       if (snapshot.data != Status.CONNECTED) {
//                         this.initConnection();
//                       } else {
//                         this.destroyConnection();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
