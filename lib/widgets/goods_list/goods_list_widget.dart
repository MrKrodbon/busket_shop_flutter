import 'package:flutter/material.dart';

import '../../Products/productsModel.dart';
import '../../resources/resources.dart';

class GoodsListWidget extends StatefulWidget {
  const GoodsListWidget({Key? key}) : super(key: key);

  @override
  State<GoodsListWidget> createState() => _GoodsListWidgetState();
}

class _GoodsListWidgetState extends State<GoodsListWidget> {
  @override
  final _goods = [
    Products(
      id: 1,
      productName: 'Wilson 3X3',
      imageName: AppImages.wilsonFiba3x3OfficialGame,
      description: 'Оригинальний м\'яч Wilson Official FIBA 3x3 2020 GAME BALL',
      price: '1500',
    ),
    Products(
      id: 2,
      productName: 'Spalding Nba',
      imageName: AppImages.spaldingNba,
      description: '',
      price: '800',
    ),
    Products(
      id: 3,
      productName: 'Spalding Red and White',
      imageName: AppImages.spaldingRedWhite,
      description: '',
      price: '1200',
    ),
    Products(
      id: 4,
      productName: 'Spalding Turkish',
      imageName: AppImages.spaldingTurkish,
      description: '',
      price: '1300',
    ),
    Products(
      id: 5,
      productName: 'Wilson Ncaa',
      imageName: AppImages.wilsonNcaa,
      description: '',
      price: '1100',
    ),
    Products(
      id: 6,
      productName: 'Wilson ShowCase',
      imageName: AppImages.wilsonShowCase,
      description: '',
      price: '1000',
    ),
    Products(
      id: 7,
      productName: 'Wilson bestDad',
      imageName: AppImages.bestDad,
      description: '',
      price: '900',
    )
  ];

  final _searchController = TextEditingController();
  void _searchGoods() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredGoods = _goods.where((Products goods) {
        return goods.productName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredGoods = _goods;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredGoods = _goods;
    _searchController.addListener(_searchGoods);
  }

  void _onGoodsTap(int index) {
    final id = _goods[index].id;
    Navigator.pushNamed(context, 'main_screen/GoodsDetailsWidget',
        arguments: id);
  }

  var _filteredGoods = <Products>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 65),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredGoods.length,
            itemExtent: 170,
            itemBuilder: (BuildContext context, int index) {
              final goods = _filteredGoods[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: (8),
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(goods.imageName),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  goods.productName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  goods.description,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  goods.price,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(onTap: () => _onGoodsTap(index)),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white.withAlpha(230),
              label: const Text('Пошук'),
            ),
          ),
        ),
      ],
    );
  }
}
