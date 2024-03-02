import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/info/index.dart';
import 'package:flutter_rent_house/widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({super.key});

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBarWidget(
            onSearch: () {
              Navigator.of(context).pushNamed('search');
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Info(),
          Info(),
          Info()
        ]));
  }
}
