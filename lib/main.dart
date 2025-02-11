import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:mingu_kang/utils/custom_router.dart';

void main() {
  setPathUrlStrategy();
  /// 이걸 써줘야 url이 정확하게 잘 바뀐다.
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp.router(
      title: 'Mingu Kang',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Mingu Kang'),
      routerConfig: CustomRouter.router,
      debugShowCheckedModeBanner: false,
    );

    return kIsWeb ?
        LayoutBuilder(
            builder: (build, layoutConstraint) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: app,
                ),
              );
            }
        ) :
        app;
  }
}

class MyHomePage extends StatefulWidget {
  final Widget child;

  // const MyHomePage({super.key});
  const MyHomePage({super.key, required this.child});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: CloseButton(onPressed: () => GoRouter.of(context).pop()),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_getSelectedAppBarTitle(_currentIndex)),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Contact'),
        ],
      ),
    );
  }

  /// url에 따라서 화면에 보여줄 index return
  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/history')) return 1;
    if (location.startsWith('/contact')) return 2;
    return 0; // 기본값: Home
  }

  /// index에 따라서 보여줄 app bar title return
  String _getSelectedAppBarTitle(int index) {
    switch (index) {
      case 0: return 'Mingu Kang';
      case 1: return 'History';
      case 2: return 'Contact';
      default: return 'Unknown';
    }
  }

  /// index가 바뀔 때마다 url을 변경해줌. (url을 변경해야 실제 화면이 바뀜)
  void _onTap(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/history');
        break;
      case 2:
        context.go('/contact');
        break;
    }
  }
}
