import 'package:fgmp_hm_4/main.dart';
import 'package:fgmp_hm_4/models/album_model/album_model.dart';
import 'package:fgmp_hm_4/widgets/ServicesProvider.dart';
import 'package:flutter/material.dart';

class ErrorOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Something went wrong'),
    );
  }
}

class SuccessOutput extends StatelessWidget {
  final List<Album> data;

  SuccessOutput({this.data, Key key}) : super(key: key);

  Card _renderAlbum(Album album, BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.album, arguments: album);
        },
        title: Hero(
          tag: '${album.title}',
          child: Text(album.title),
          flightShuttleBuilder: (BuildContext context,
              Animation<double> animation,
              HeroFlightDirection direction,
              BuildContext from,
              BuildContext to) {
            return Icon(
              direction == HeroFlightDirection.push
                  ? Icons.airplanemode_active
                  : Icons.airplanemode_inactive,
              size: 30.0,
            );
          },
        ),
        subtitle: Text(
            'Id: ${album.id.toString()}. User: ${album.userId.toString()}'),
      ),
    );
  }

  List<Card> _renderAlbums(List<Album> albums, BuildContext context) {
    return albums.map((Album album) => _renderAlbum(album, context)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: _renderAlbums(data, context),
      ),
    );
  }
}

class Albums extends StatelessWidget {
  Widget _renderDone(AsyncSnapshot<List<Album>> snapshot) {
    return snapshot.hasError
        ? ErrorOutput()
        : SuccessOutput(
            data: snapshot.data,
          );
  }

  Widget _renderProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  bool _isDone(AsyncSnapshot<List<Album>> snapshot) {
    return snapshot.connectionState == ConnectionState.done;
  }

  Widget _builder(BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
    return _isDone(snapshot) ? _renderDone(snapshot) : _renderProgress();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServicesProvider.of(context).restClient.all(),
      builder: _builder,
    );
  }
}
