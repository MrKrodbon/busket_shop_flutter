import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import 'goods_detaild_main_info_widget.dart';

class GoodsDetailsWidget extends StatefulWidget {
  final int goodsId;
  GoodsDetailsWidget({Key? key, required this.goodsId}) : super(key: key);

  @override
  State<GoodsDetailsWidget> createState() => _GoodsDetailsWidgetState();
}

class _GoodsDetailsWidgetState extends State<GoodsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wilson 3X3'),
        backgroundColor: AppColors.mainLightBlack,
      ),
      body: ListView(
        children: [
          MainInfoWidget(),
        ],
      ),
      backgroundColor: Colors.white70,
    );
  }
}
