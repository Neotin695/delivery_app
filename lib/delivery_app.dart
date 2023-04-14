import 'package:delivery/core/services/route_generator.dart';
import 'package:delivery/view/auth/screen/signup_phone_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DeliveryApp extends MaterialApp {
  DeliveryApp(RouteGenerator routeGenerator)
      : super(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
          ],
          theme: ThemeData(
            fontFamily: 'Tajawal',
          ),
          initialRoute: SignUpPage.routeName,
          onGenerateRoute: routeGenerator.generateRoute,
        );
}
