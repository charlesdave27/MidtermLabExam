import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Ito ang pinaka root widget ng buong app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialApp para sa theme at navigation ng app
    return MaterialApp(
      title: 'Stateless Counter',
      theme: ThemeData(
        primarySwatch: Colors.red, 
      ),
      home: const HomePage(), 
    );
  }
}

//StatelessWidget para sa home page ng app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'), // Title ng AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(
            'Stateless Counter:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          StatelessCounterParent(),
        ],
      ),
    );
  }
}

// Stateless widget na ipapasa ang count at onIncrement na function
class StatelessCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement; 

  const StatelessCounter({
    super.key,
    required this.count, 
    required this.onIncrement, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: <Widget>[
        // Button para mag-increment ng counter
        ElevatedButton(
          onPressed: onIncrement,
          child: const Text(' Tap to Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $count', style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}

// Parent widget na naghahandle ng state ng counter
class StatelessCounterParent extends StatefulWidget {
  const StatelessCounterParent({super.key});

  @override
  State<StatelessCounterParent> createState() => _StatelessCounterParentState();
}

// Dito nagbabago ang state ng counter value
class _StatelessCounterParentState extends State<StatelessCounterParent> {
  int _count = 0; 

  // Function para mag-increment and counter
  void _handleIncrement() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ireturn ang current count at onIncrement function sa StatelessCounter widget
    return StatelessCounter(
      count: _count,
      onIncrement: _handleIncrement,
    );
  }
}
