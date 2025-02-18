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
    // return Container(
    //   color: Colors.white,
    //   child: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         context.push('/home/detail');
    //       },
    //       child: const Text('Go to Detail'),
    //     ),
    //   ),
    // );

    // return DefaultTabController(
    //   animationDuration: const Duration(milliseconds: 300),
    //   length: 3,
    //   child: Column(
    //     children: [
    //       // _pageMoveButton(),
    //       _tabBar(),
    //
    //       /// Expanded 없으면 오류 발생
    //       /// Horizontal viewport was given unbounded height.
    //       Expanded(child: _tabBarView()),
    //     ],
    //   ),
    // );

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

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      tabs: const [
        Tab(text: "Tab 1"),
        Tab(text: "Tab 2"),
        Tab(text: "Tab 3"),
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        SingleChildScrollView(
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text(
                  "Page 1",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(height: 500,),
                const Text(
                  "Page 1",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(height: 500,),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            "Page 2",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text(
            "Page 3",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _pageMoveButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            /// TabBar는 애니메이션 없이 바로 이동하지만
            /// TabBarView는 화면 전환 애니메이션 발생
            tabController.index = 2;
          },
          child: const Text("페이지 이동"),
        ),
        ElevatedButton(
          onPressed: () {
            /// TabBar와 TabBarView 화면 전환 애니메이션 발생
            tabController.animateTo(2);
          },
          child: const Text("페이지 이동(애니메이션)"),
        ),
      ],
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Stack(
        // alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              color: Colors.yellow,
              width: double.infinity,
              height: 1,
            ),
          ),
          TabBar(
            isScrollable: true,
            // labelStyle: style17sb.copyWith(letterSpacing: -0.2),
            // unselectedLabelStyle: style17sb.copyWith(letterSpacing: -0.2),
            // labelColor: WavyColors.grey10,
            // unselectedLabelColor: WavyColors.grey7,
            dividerHeight: 0,
            // indicatorColor: WavyColors.grey9,
            indicatorWeight: 3,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(1.5),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 3,
              ),
            ),
            tabs: const [
              Center(child: Text('here1')),
              Center(child: Text('here2')),
            ],
          ),
        ],
      ),
    );
  }
}
