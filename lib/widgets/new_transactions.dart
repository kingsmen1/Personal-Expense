import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function newTx;

  /*method 1 of TextField;*/
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  NewTransactions(this.newTx);

/*method 2 of TextField
  String titleInput;
  String amountInput;*/

  void addingData() {

    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);


    if (enteredTitle.isEmpty || enteredAmount <= 0 ){

      return ;
    }

    newTx(enteredTitle, enteredAmount);
  }

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
              onSubmitted: (_) => addingData(),
              keyboardType: TextInputType.text,

              /*this is method 2 to assign the userInput to variables
                      onChanged: (val) => titleInput = val,
                      },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              /*this is the method1 the fluter automatically
                        connects the controller: to the textFields and lisetens
                        to the userinput */

              controller: amountInput,
              onSubmitted: (_) => addingData(),

              /*this is method 2 to assign the userInput to variables
                      onChanged: (val){
                        amountInput = val;
                      },*/
            ),
            FlatButton(
                onPressed:addingData,

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
