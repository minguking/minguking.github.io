import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final myWorks = [
    'Kpick',
    'Stipop',
    'Bepro',
    'Parking Cloud',
    'Vridge',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: myWorks.length,
        itemBuilder: (BuildContext listContext, int index) {
          return Text(myWorks[index]);
        },
      ),
      // child: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       context.push('/home/detail');
      //     },
      //     child: const Text('Go to Detail'),
      //   ),
      // ),
    );
  }
}
