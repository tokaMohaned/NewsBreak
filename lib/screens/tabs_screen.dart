import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/network/remote/api_manager.dart';
import 'package:newsapi/screens/widget/news_item.dart';
import 'package:newsapi/screens/widget/source_item.dart';

import '../model/SourcesResponse.dart';

class TabsScreen extends StatefulWidget {
 List<Sources>sources;
 TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,


            //here we need to convert sources list to tab list
            //to create tab list of sources
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (value)
                {
                 selectedIndex=value;
                 setState(() {

                 });
                },
                tabs: widget.sources.map((source) {
              return Tab(child:
              SourceItem(source,
                  widget.sources.indexOf(source)==selectedIndex),);
              //index of take the object of the class sources
              // and we will get the the integer of index of source in list
             // اقارن قيمه السليكتد اندكس مع السورس فلو ترو هيحدد الحاجه
//it is add Widget becuase in the statefull when we caled variable in the
//  upper class we add widget before it to reach to that variable

              //   Tab(child:
              //   Chip(
              //     label: Text(e.name?? "",style: TextStyle(
              //       color: Colors.black
              // ),),
              //   ),);

            }).toList()
            )),
        FutureBuilder(
            future: ApiManager.getNewsData(widget.sources[selectedIndex].id?? ""),
            builder: (context,snapshot){
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
              var newsData=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(itemBuilder:(context, index)
                {return NewsItem(newsData[index]);

                },
                itemCount: newsData.length,),
              );
            })
      ],
    );

    ListView.builder(
      itemBuilder: (context, index) {
        return Text(widget.sources[index].name ?? " ");
      },
      itemCount: widget.sources.length,
    );
  }
}
