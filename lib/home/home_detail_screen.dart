import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // context.go('/home/detail');
            context.pop();
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}
