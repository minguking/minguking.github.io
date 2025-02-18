import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    tabController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Padding(
          padding: EdgeInsets.zero,
          child: NestedScrollView(
            // controller: PrimaryScrollController.of(context), // 상위 AppBar와 Scroll 동기화
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(child: SizedBox(height: 80)), // 상위 AppBar 높이만큼 간격 맞추기
              // SliverOverlapAbsorber(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),),
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.grey,
                  toolbarHeight: 0,
                  pinned: true,
                  flexibleSpace: Container(color: Colors.white),
                  forceMaterialTransparency: true,
                  bottom: _buildTabBar(),
                ),
              ),
            ],

            body: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        // controller: PrimaryScrollController.of(context), // 상위 AppBar와 Scroll 동기화
                        child: Column(
                          children: [
                            SizedBox(height: 200,),
                            Text('Content for Tab 1'),
                            SizedBox(height: 800,),
                            Text('Content for Tab 11'),
                            SizedBox(height: 500,),
                          ],
                        ),
                      ),
                      Center(child: Text('Content for Tab 2')),
                    ],
                  ),
                ),
              ],
            ),
            // body: const Text("good"),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Align(
            // alignment: Alignment.center,
            child: Container(
              // margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              // color: Colors.yellow,
              width: double.infinity,
              height: 1,
            ),
          ),
          TabBar(
            isScrollable: true,
            dividerHeight: 2,
            indicatorWeight: 2,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(1.5),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 3,
              ),
            ),
            tabs: const [
              SizedBox(
                width: 60,
                height: 48,
                child: Center(
                  child: Text('here1',),
                ),
              ),
              SizedBox(
                width: 60,
                height: 48,
                child: Center(
                  child: Text('here2',),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
