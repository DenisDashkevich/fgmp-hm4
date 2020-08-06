import 'package:fgmp_hm_4/services/rest_client/rest_client.dart';
import 'package:flutter/material.dart';

class ServicesProvider extends InheritedWidget {
  final RestClient restClient;

  const ServicesProvider({
    Key key,
    @required this.restClient,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static ServicesProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ServicesProvider>();
  }

  @override
  bool updateShouldNotify(ServicesProvider old) {
    return true;
  }
}
