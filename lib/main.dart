import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Relay Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RelayControlPage(),
    );
  }
}

class RelayControlPage extends StatefulWidget {
  const RelayControlPage({super.key});

  @override
  RelayControlPageState createState() => RelayControlPageState();
}

class RelayControlPageState extends State<RelayControlPage> {
  bool _relayState = false;
  String _connectionStatus = "Disconnected";

  void _toggleRelay() {
    setState(() {
      _relayState = !_relayState;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Relay Control'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Connection Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Status: $_connectionStatus'),
                    Text('Relay: ${_relayState ? "ON" : "OFF"}'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 200,
              height: 200,
              child: ElevatedButton(
                onPressed: _toggleRelay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _relayState ? Colors.green : Colors.red,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: Text(
                  _relayState ? 'ON' : 'OFF',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _relayState ? Icons.power : Icons.power_off,
                  color: _relayState ? Colors.green : Colors.red,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  _relayState ? 'Relay is ON' : 'Relay is OFF',
                  style: TextStyle(
                    fontSize: 18,
                    color: _relayState ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleRelay,
        child: Icon(_relayState ? Icons.toggle_on : Icons.toggle_off),
      ),
    );
  }
}