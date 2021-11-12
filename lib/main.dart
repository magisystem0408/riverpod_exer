import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test/provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //consumerが変わった時だけ変化する
        title: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget child) =>
                Text(ref.watch(titleProvider))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget child) =>
                    Text(ref.watch(messageProvider))),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget child) =>
                  Text(
                ref.watch(countProvider).toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget child) =>
            FloatingActionButton(
          onPressed: () => ref.watch(countProvider.state).state++,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {}
}
