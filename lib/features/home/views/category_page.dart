import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_styles.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  List<Map<String, String>> categories = [
    {'name': 'Mathematics', 'image': Assets.imagesMath},
    {'name': 'English', 'image': Assets.imagesEnglish},
    {'name': 'History', 'image': Assets.imagesHistory},
    {'name': 'Computing', 'image': Assets.imagesComputing},
    {'name': 'Science', 'image': Assets.imagesScience},
    {'name': 'Riddles', 'image': Assets.imagesRiddles},
  ];

  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Welcome to Educational Quiz Game, Choose a subject to start',
              style: style.bodyStyle()),
          const SizedBox(height: 20),
          Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: categories
                  .map(
                    (category) => InkWell(
                      onTap: () {
                        // show bottom message to pick single player or multiplayer
                        

                      },
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width * 0.4,
                            height: size.width * .4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  category['image']!,
                                  width: 50,
                                ),
                                Text(
                                  category['name']!,
                                  style: style.titleStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
