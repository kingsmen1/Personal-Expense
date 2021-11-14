import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {

  /*method 1 of TextField;*/
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

/*method 2 of TextField
  String titleInput;
  String amountInput;*/


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Tile'),
              /*this is the method1 the fluter automatically
                        connects the controller: to the textFields and lisetens
                        to the userinput */

              controller: titleInput,

              /*this is method 2 to assign the userInput to variables
                      onChanged: (val) => titleInput = val,
                      },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              /*this is the method1 the fluter automatically
                        connects the controller: to the textFields and lisetens
                        to the userinput */

              controller: amountInput,

              /*this is method 2 to assign the userInput to variables
                      onChanged: (val){
                        amountInput = val;
                      },*/
            ),
            FlatButton(
                onPressed: () {
                  print(titleInput.text);print(amountInput.text);
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
