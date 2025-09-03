import 'package:flutter_application/provider/all_providers.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<AllProviders>(create: ((context) => AllProviders())),
];
