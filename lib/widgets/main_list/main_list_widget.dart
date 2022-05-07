import 'package:flutter/material.dart';

import '../../Products/newGoodsModel.dart';
import '../../resources/resources.dart';

class MainListWidget extends StatefulWidget {
  const MainListWidget({Key? key}) : super(key: key);

  @override
  State<MainListWidget> createState() => _MainListWidgetState();
}

class _MainListWidgetState extends State<MainListWidget> {
  final _newProducts = [
    NewProducts(
        id: 1,
        imageName: AppImages.atlanta,
        productDescription: 'NBA ATLANTA YOUNG MIXTAPE SWINGMAN UNISEX'),
    NewProducts(
        id: 2,
        imageName: AppImages.chicagoBulls,
        productDescription: 'NBA Chicago Bulls'),
    NewProducts(
        id: 2,
        imageName: AppImages.goldenState,
        productDescription: 'NBA ATLANTA YOUNG MIXTAPE SWINGMAN UNISEX'),
    NewProducts(
        id: 3,
        imageName: AppImages.newYork,
        productDescription: 'NBA ATLANTA YOUNG MIXTAPE SWINGMAN UNISEX'),
    NewProducts(
        id: 4,
        imageName: AppImages.losSuns,
        productDescription: 'NBA ATLANTA YOUNG MIXTAPE SWINGMAN UNISEX'),
    NewProducts(
        id: 5,
        imageName: AppImages.newYork,
        productDescription: 'NBA ATLANTA YOUNG MIXTAPE SWINGMAN UNISEX'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Image(
          fit: BoxFit.cover,
          height: 400,
          image: AssetImage(
            AppImages.bryant,
          ),
        ),
        ColoredBox(
          color: const Color.fromRGBO(197, 197, 197, 1),
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _newProducts.length,
                  itemExtent: 400,
                  itemBuilder: (BuildContext context, int index) {
                    final currentProducts = _newProducts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Image(
                                  image: AssetImage(currentProducts.imageName),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text(currentProducts.productDescription),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }
}
