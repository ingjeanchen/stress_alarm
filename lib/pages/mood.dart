import 'package:flutter/material.dart';
import 'package:stress_alarm/widgets/gradient_container.dart';

class MoodPage extends StatefulWidget {
  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String selectedMood = '';

  final moods = [
    'Happy',
    'Sad',
    'Angry',
    'Excited',
    'Nervous',
  ];

  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: moods.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(moods[index]),
                onTap: () {
                  setState(() {
                    selectedMood = moods[index];
                  });

                  // When a list tile is tapped, show a dialog with the selected mood
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your Mood'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('You are feeling $selectedMood'),
                            SizedBox(height: 16),
                            TextField(
                              controller: reasonController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Why do you feel this way?',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Close the dialog when the "OK" button is pressed
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
