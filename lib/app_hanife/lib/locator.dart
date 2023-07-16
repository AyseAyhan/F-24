import 'package:untitled6/app_hanife/lib/services/auth_service.dart.dart';
import 'package:untitled6/app_hanife/lib//services/provider/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/app_hanife/lib/services/auth_service.dart.dart';
import 'package:untitled6/app_hanife/lib/services/provider/auth_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthProvider>(AuthProvider());
  locator.registerSingleton<AuthService>(AuthService());
}
