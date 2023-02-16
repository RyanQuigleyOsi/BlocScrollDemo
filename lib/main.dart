import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_overlay_cubit.dart';
import 'home_page_overlay_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => HomePageOverlayCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page')
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool alt = true;
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<HomePageOverlayCubit, HomePageOverlayState>(
          builder: (final _, final state) {
            return Visibility(
              visible: state.isVisible,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: SizedBox(
                      width: state.width,
                      child: state.content,
                  )),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: const Text("ScrollView"),
            onPressed: () 
            { 
              if(alt){
                BlocProvider.of<HomePageOverlayCubit>(context).newOverlay(content: exampleScrollView1());
                alt = !alt;
              }else{
                BlocProvider.of<HomePageOverlayCubit>(context).newOverlay(content: exampleScrollView2());
                alt = !alt;
              }
            }
          ),
          TextButton(
            child: const Text("TabController"),
            onPressed: () 
            { 
              if(alt){
                BlocProvider.of<HomePageOverlayCubit>(context).newOverlay(content: exampleTabController1());
                alt = !alt;
              }else{
                BlocProvider.of<HomePageOverlayCubit>(context).newOverlay(content: exampleTabController2());
                alt = !alt;
              }
            }
          )
        ]
      )
    );
  }

//There are two of each for the sake of alternating colors easy

  Widget exampleScrollView1(){
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Demo"),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (final BuildContext context, final int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text("Grid Item $index"),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (final BuildContext context, final int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("List Item $index"),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget exampleScrollView2(){
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Demo"),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (final BuildContext context, final int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent[100 * (index % 9)],
                child: Text("Grid Item $index"),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (final BuildContext context, final int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.pink[100 * (index % 9)],
                child: Text("List Item $index"),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget exampleTabController1(){
    return const DefaultTabController(
      length: 8,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: TabBarView(
          children: [
            Center(
                child:Text("Page1"),),
            Center(
                child:Text("Page2"),),
            Center(
                child:Text("Page3"),),
            Center(
                child:Text("Page4"),),
            Center(
                child:Text("Page5"),),
            Center(
                child:Text("Page6"),),
            Center(
                child:Text("Page7"),),
            Center(
                child:Text("Page8"),),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab1"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab2"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab3"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab4"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab5"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab6"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab7"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab8"))),
          ],
          isScrollable: true,
        ),
      )
    );
  }

  Widget exampleTabController2(){
    return const DefaultTabController(
      length: 8,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: TabBarView(
          children: [
            Center(
                child:Text("Page1"),),
            Center(
                child:Text("Page2"),),
            Center(
                child:Text("Page3"),),
            Center(
                child:Text("Page4"),),
            Center(
                child:Text("Page5"),),
            Center(
                child:Text("Page6"),),
            Center(
                child:Text("Page7"),),
            Center(
                child:Text("Page8"),),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab1"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab2"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab3"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab4"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab5"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab6"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab7"))),
            Tab(icon: SizedBox(width: 90.0, child: Text("Tab8"))),
          ],
          isScrollable: true,
        ),
      )
    );
  }
}


