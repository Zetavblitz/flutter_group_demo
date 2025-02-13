import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dog gone app!'),
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
  void _erichPage() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What the dog doin?",
              style: Theme.of(context).textTheme.headlineMedium,
              ),
            Column(children: [
              TextButton(
                onPressed: _erichPage,
                child: Column(
                  children: [
                    const Text("Goin' to Erich's page."),
                    const Icon(Icons.pets),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Column(
                  children: [
                    const Text("Goin' to [name]'s page."),
                    const Icon(Icons.pets),
                  ],
                )
              )
            ],)
          ],
        ),
      ),
    );
  }
}
