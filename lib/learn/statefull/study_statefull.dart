import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'increment_product.dart';

class StudyStatefull extends StatefulWidget {
  @override
  _StudyStatefullState createState() => _StudyStatefullState();
}

class _StudyStatefullState extends State<StudyStatefull> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Logger().e("VBT");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      body: Column(
        children: <Widget>[
          ProfileText(),
          IncrementProductCard(
            onProductClear: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Text("Product is empty"),
                ),
              );
            },
            onChange: (count) {
              print("$count");
            },
          ),
          buildCenterLogo(),
        ],
      ),
    );
  }

  Center buildCenterLogo() => Center(child: FlutterLogo(size: 50));
}

class ProfileText extends StatefulWidget {
  @override
  _ProfileTextState createState() => _ProfileTextState();
}

class _ProfileTextState extends State<ProfileText> {
  String profilName;

  @override
  void initState() {
    super.initState();
    profilName = "";
    getUserDetail(1);
  }

  Future<void> getUserDetail(int id) async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      profilName = "Veli$id";
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar;
  }

  Widget get buildAppBar => AppBar(title: isProfileNameEmpty ? buildCircularLoading() : buildTextProfileName());

  bool get isProfileNameEmpty => profilName.isEmpty;

  Text buildTextProfileName() => Text(profilName);
  CircularProgressIndicator buildCircularLoading() => CircularProgressIndicator(backgroundColor: Colors.white);
}
