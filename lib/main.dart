import 'package:busket_shop/widgets/auth/auth_widget.dart';
import 'package:flutter/material.dart';

import 'Theme/app_colors.dart';
import 'widgets/goods_details/goods_details_widget.dart';
import 'widgets/main_screen/main_screen_widget.dart';
import 'package:busket_shop/widgets/register/register_widget.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'OnTheTop',
      theme: ThemeData(
        backgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainLightBlack,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        'main_screen': (context) => const MainScreenWidget(),
        'main_screen/GoodsDetailsWidget': (context) {
          final id = ModalRoute.of(context)?.settings.arguments as int;
          return GoodsDetailsWidget(
            goodsId: id,
          );
        },
        'auth': (context) => const AuthWidget(),
        'register_screen': (context) => const RegisterWidget()
      },
      initialRoute: 'main_screen',
    );
  }
}

class Practise extends InheritedWidget {
  Practise({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  static Practise? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Practise>();
  }

  @override
  bool updateShouldNotify(Practise oldWidget) {
    return true;
  }
}
