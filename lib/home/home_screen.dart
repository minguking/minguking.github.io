import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
    return FutureBuilder(
      future: rootBundle.loadString('markdown/md_test.md'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            styleSheet: MarkdownStyleSheet
              (
              //titleStyle
              h1: TextStyle(fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
              //sub
              h2: TextStyle(color: Colors.blue, fontSize: 30),

              blockquoteDecoration: BoxDecoration(
                  color: Colors.grey
              ),


            ),
          );

          // return Container(
          //   color: Colors.white,
          // child: Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       context.push('/home/detail');
          //     },
          //     child: const Text('Go to Detail'),
          //   ),
          // ),
          // );
        } else {
          return ListView.builder(
            itemCount: myWorks.length,
            itemBuilder: (BuildContext listContext, int index) {
              return Text(myWorks[index]);
            },
          );
      }
      },
    );
  }
}
