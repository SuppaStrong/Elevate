import 'package:flutter/material.dart';


class DeleveryScreen extends StatefulWidget {
  const DeleveryScreen({Key? key}) : super(key: key);

  @override
  State<DeleveryScreen> createState() => _DeleveryScreenState();
}

class _DeleveryScreenState extends State<DeleveryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Delevery")),
    );
  }
}
