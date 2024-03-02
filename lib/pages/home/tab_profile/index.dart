import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/info/index.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/ads.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/function_button.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: [
          ProfileHeader(),
          FunctionButton(),
          AdsWidget(),
          Info(
            showTitle: true,
          )
        ],
      ),
    );
  }
}
