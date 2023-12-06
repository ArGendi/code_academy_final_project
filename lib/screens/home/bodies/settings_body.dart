import 'package:flutter/material.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  List<int> orders = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: orders.isNotEmpty,
        replacement: Center(
          child: Icon(Icons.delete, size: 50,),
        ),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i){
            return Container(
              color: Colors.green,
              child: Center(child: Text(orders[i].toString())),
            );
          },
        ),
      ),
    );
  }
}