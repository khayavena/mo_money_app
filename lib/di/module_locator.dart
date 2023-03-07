import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import "module_locator.config.dart";

final moduleLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies()  =>  init(moduleLocator);
