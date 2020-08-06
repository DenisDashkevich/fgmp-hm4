import 'package:fgmp_hm_4/models/album_model/album_model.dart';
import 'package:flutter/material.dart';

class AlbumView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Album album = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Hero(tag: '${album.title}', child: Text(album.title)),
      ),
      appBar: AppBar(
        title: Text('Album #${album.id}'),
      ),
    );
  }
}
