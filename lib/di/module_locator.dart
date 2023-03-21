import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/di/module_locator.config.dart';

final moduleLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
)
Future<void> configureDependencies()  =>  init(moduleLocator);
