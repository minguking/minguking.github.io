import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingu_kang/utils/kk_toast.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  _showWelcomeToast() {
    KKToast.show('Hello, World', context);
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showWelcomeToast();
              context.pop();
            },
            child: const Text('Go back'),
          ),
        ),
      ),
    );
  }
}
