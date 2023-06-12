import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/model/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
Sources source;
bool selected;
SourceItem(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 12),

      child: Container(
        decoration: BoxDecoration(
          color: selected? Color(0xFF39A552): Colors.transparent,
      borderRadius: BorderRadius.circular(25),
          border: Border.all(color:Color(0xFF39A552),
          width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(source.name ?? "",style: TextStyle(
            color: selected? Colors.white :Color(0xFF39A552),
          ),),
        ),
      ),
    );
  }
}
