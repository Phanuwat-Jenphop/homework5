import 'package:flutter/material.dart';

class Showdata extends StatefulWidget {
  const Showdata({super.key});

  @override
  State<Showdata> createState() => _showState();
}

class _showState extends State<Showdata> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.cyanAccent,
        border: Border.all(
          color: Colors.blueGrey,
        )
      ),
    );
  
  }
}
