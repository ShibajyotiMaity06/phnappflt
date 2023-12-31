import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final String title;
  final VoidCallback onTap ;
  final bool loading;
  const Roundbutton ({Key? key,
    required this.title,
    required this.onTap,
    this.loading = false
  }) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading ? CircularProgressIndicator():
        Text(title),),
      ),
    );
  }
}

