import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.grey,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.black,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}