import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/view/menu/menu.dart';
import 'package:foodzee/view/tab_bar/from_barnyard.dart';
import 'package:foodzee/view/tab_bar/from_india.dart';
import 'package:foodzee/view/tab_bar/salads_soups.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuView(),
                ));
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          dividerHeight: 3,
          labelPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          indicatorColor: kpink,
          labelColor: kpink,
          unselectedLabelColor: kgrey,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Text("Salads and Soups"),
            Text("From the Barnyard"),
            Text('From India')
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [SaladsAndSoups(), FromBarnyard(), FromIndia()]),
    );
  }
}
