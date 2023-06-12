import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/model/SourcesResponse.dart';
import 'package:newsapi/screens/tabs_screen.dart';

import 'network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "homeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight:Radius.circular(22) ,

          ),
        ),
        backgroundColor: Color(0xFF39A552),
        title: Text("News App"),
      ),
      body: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text("somthing went worgn"),
                TextButton(onPressed: () {}, child: Text("tray agian")),
              ],
            );
          }
          if (snapshot.data?.status !=
              'ok') //VALIDATION must be nullable it is better
          {
            return Column(
              children: [
                Text("Error!!!"),
                TextButton(onPressed: () {}, child: Text("tray agian")),
              ],
            );
          }
          var sources = snapshot.data?.sources ?? [];
          return TabsScreen(sources);
        },
      ),
    );
  }
}
