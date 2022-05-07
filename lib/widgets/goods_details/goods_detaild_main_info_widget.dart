import 'package:busket_shop/resources/resources.dart';
import 'package:flutter/material.dart';

import '../../Theme/appButtonStyle.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Image(
                    image: AssetImage(AppImages.wilsonFiba3x3OfficialGame),
                    height: 250,
                    width: 250,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                    'Оригинальний м\'яч Wilson Official FIBA 3x3 2020 GAME BALL'),
                const SizedBox(height: 20),
                const Text(
                  'В наявності',
                  style: TextStyle(color: Colors.green),
                ),
                const SizedBox(height: 20),
                const Text(
                  '1500',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => print('Подзвонив'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20),
                      Text('+380(98) 765 43 21'),
                    ],
                  ),
                  style: AppButtonStyle.radiusBorder,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => print('Chating'),
                      child: Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                      style: AppButtonStyle.radiusBorder,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => print('Купив'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.local_grocery_store,
                              color: Colors.black,
                            ),
                            Text('Купити'),
                          ],
                        ),
                        style: AppButtonStyle.radiusBorder,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.menu_book),
                    SizedBox(
                      width: 50,
                    ),
                    Text('Опис та характеристики'),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                '''Професійний баскетбольний м'яч Wilson, призначений для гри на жорстких покриттях.
                
                * КОНТРОЛЬ М'ЯЧУ
                        Покришка із синтетичної шкіри з додаванням гігроскопічної мікрофібри вбирає вологу з рук під час гри та сприяє покращеному контролю м'яча.

                * СТІЙКІСТЬ ДО ЗНОСУ
                        Покришка із міцної синтетичної шкіри забезпечує м'ячу високу зносостійкість та довгий термін служби.

                * СХВАЛЕНО FIBA
                        Розмір та вага м'яча відповідають вимогам міжнародної федерації баскетболу FIBA.''',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
