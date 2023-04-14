import 'package:delivery/core/services/route_generator.dart';
import 'package:delivery/delivery_app.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'core/services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Sizer(builder: (context, orientation, deviceTYpe) {
    return DeliveryApp(RouteGenerator());
  }));
}
