import 'package:flutter/cupertino.dart';

class CategoriesScreen extends StatelessWidget {
// static const String routName="homeScreen2";
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Text("Pick your category of interest"),
        GridView.builder(

            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 24,
              crossAxisSpacing: 24,
            ),
            itemBuilder:(context,index)
            {
              return
            }
        ),

      ],
    );
  }
}
