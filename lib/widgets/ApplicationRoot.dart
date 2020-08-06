import 'package:dio/dio.dart';
import 'package:fgmp_hm_4/services/rest_client/rest_client.dart';
import 'package:fgmp_hm_4/widgets/Albums.dart';
import 'package:fgmp_hm_4/widgets/ServicesProvider.dart';
import 'package:flutter/material.dart';

class ApplicationRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ServicesProvider(
        restClient: RestClient(Dio()),
        child: Albums(),
      ),
      appBar: AppBar(
        title: Text('Fgmp-hm4'),
      ),
    );
  }
}
