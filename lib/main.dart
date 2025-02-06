import 'package:flutter/material.dart';
import 'dart:math'; // For random number generation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';
  List<String> forecast = []; // Store forecast data

  void _fetchWeather() {
    // Simulate weather data
    Random random = Random();
    int temp = 15 + random.nextInt(16); // Temperature between 15 and 30
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    String condition = conditions[random.nextInt(3)];

    setState(() {
      temperature = '$temp°C';
      weatherCondition = condition;
    });
  }

  void _fetch7DayForecast() {
    forecast = List.generate(
        7,
        (index) => 'Day ${index + 1}: ${Random().nextInt(25) + 15}°C, ${[
              'Sunny',
              'Cloudy',
              'Rainy'
            ][Random().nextInt(3)]}');
    setState(() {}); // Trigger rebuild to show forecast
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Info'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  cityName = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter City Name',
                ),
              ),
              ElevatedButton(
                onPressed: _fetchWeather,
                child: const Text('Fetch Weather'),
              ),
              ElevatedButton(
                onPressed: _fetch7DayForecast,
                child: const Text('Fetch 7-Day Forecast'),
              ),
              const SizedBox(height: 20), // Spacing
              Text('City: $cityName', style: const TextStyle(fontSize: 18)),
              Text('Temperature: $temperature',
                  style: const TextStyle(fontSize: 18)),
              Text('Weather: $weatherCondition',
                  style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 20),
              const Text("7-Day Forecast:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                // Or ListView.builder for a scrollable list if needed
                children: forecast.map((day) => Text(day)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
