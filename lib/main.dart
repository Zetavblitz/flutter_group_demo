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

// setup main app page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// main app page concrete behavior
class _MyHomePageState extends State<MyHomePage> {

  // called when the matching button is pressed.
  void _erichPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ErichPage(title: "Erich's page!")),
    );
  }

  void _markPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MarkPage(title: "Mark's page!")),
    );
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

            // everything interesting is in here.
            Text(
              "What the dog doin?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // column of buttons
            Column(children: [

              // erich's button do not mess with this
              TextButton(
                onPressed: _erichPage,
                child: Column(
                  children: [
                    const Text("Goin' to Erich's page."),
                    const Icon(Icons.pets),
                  ],
                ),
              ),

              // team members add names and behavior here
              TextButton(
                onPressed: _markPage,
                child: Column(
                  children: [
                    const Text("Goin' to Mark's page."),
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

// setup for a new page
class ErichPage extends StatefulWidget {
  const ErichPage({super.key, required this.title});
  final String title;

  @override
  State<ErichPage> createState() => _ErichPageState();
}

// implementation of a new page
class _ErichPageState extends State<ErichPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network('https://media1.tenor.com/m/i4UKA0PCT8IAAAAd/dance-dog.gif'),
            Text(
              "The dog dancin!",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ]
        ),
      )
    );
  }
}

class MarkPage extends StatefulWidget {
    const MarkPage({super.key, required this.title});
    final String title;

    @override
    State<MarkPage> createState() => _MarkPageState();
  }

class _MarkPageState extends State<MarkPage> {
  double _size = 100.0; // Initial size of the dog icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dog Resizer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.pets,
              size: _size,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 20),
          Slider(
            value: _size,
            min: 50.0,
            max: 300.0,
            onChanged: (value) {
              setState(() {
                _size = value;
              });
            },
          ),
        ],
      ),
    );
  }
}