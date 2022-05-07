import 'package:busket_shop/Theme/app_colors.dart';
import 'package:busket_shop/widgets/goods_list/goods_list_widget.dart';
import 'package:busket_shop/widgets/main_list/main_list_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void selectedTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OnTheTop',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: AppColors.mainLightBlack,
        leading: IconButton(
          onPressed: () => _toAuth(),
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          MainListWidget(),
          GoodsListWidget(),
          Text('Відгуки'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'Новинки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Сповіщення',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: selectedTab,
      ),
    );
  }

  void _toAuth() {
    Navigator.of(context).pushReplacementNamed('auth');
    print('try to move to auth');
    setState(() {});
  }
}
