import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
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
          return Container();
        }
      },
    );
  }
}
