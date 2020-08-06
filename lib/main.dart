import 'package:fgmp_hm_4/widgets/Album.dart';
import 'package:fgmp_hm_4/widgets/ApplicationRoot.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/';
  static String album = '/album';
}

void main() {
  return runApp(MaterialApp(
    title: 'FGMP-HM-4',
    initialRoute: Routes.home,
    routes: {
      Routes.home: (BuildContext context) => ApplicationRoot(),
      Routes.album: (BuildContext context) => AlbumView(),
    },
  ));
}
