import 'package:flutter/material.dart';
import 'package:myapp/redux/container/amc_detail.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/model/amc.dart';

class AMCDetailScreen extends StatelessWidget {
  static final String routeName = "/amcScreen";
  final AMC amc;
  AMCDetailScreen({Key key, @required this.amc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text(amc.name),
      ),
      body: AMCDetailContainer(amc),
      drawer: AppDrawer(),
    );
  }
}