import 'package:flutter/material.dart';

class Test extends StatelessWidget {

  var listgenerate = List.generate(3, (int index) {
  return index * index;
  });



  @override
  Widget build(BuildContext context) {
    print(listgenerate);
    return Container();
  }
}
