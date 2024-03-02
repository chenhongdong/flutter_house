import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/info/index.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index_navigator.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index_recommend.dart';
import 'package:flutter_rent_house/widgets/common_swiper.dart';
import 'package:flutter_rent_house/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBarWidget(
            showLocaton: true,
            showMap: true,
            onSearch: () {
              Navigator.of(context).pushNamed('search');
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            CommonSwiper(),
            IndexNavigator(),
            IndexRecommend(),
            Info(showTitle: true)
          ],
        ));
  }
}
