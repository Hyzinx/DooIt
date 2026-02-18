import 'package:flutter/material.dart';

class Pinned extends StatefulWidget {
  const Pinned({super.key});

  @override
  State<Pinned> createState() => _PinnedState();
}

class _PinnedState extends State<Pinned> {
  @override
  Widget build(BuildContext context) {
    return Text("Pinned");
  }
}