import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_rent_house/routes.dart';
import 'package:flutter_rent_house/scoped_model/auth.dart';
import 'package:flutter_rent_house/scoped_model/city.dart';
import 'package:flutter_rent_house/scoped_model/room_filter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: ScopedModel<CityModel>(
          model: CityModel(),
          child: ScopedModel<FilterBarModel>(
            model: FilterBarModel(),
            child: OKToast(
                child: MaterialApp(
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
                  primaryColor: Colors.green),
              onGenerateRoute: router.generator,
            )),
          ),
        ));
  }
}
