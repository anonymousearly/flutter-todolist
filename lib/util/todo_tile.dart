import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        child: Text("Konnichiwa"),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}
