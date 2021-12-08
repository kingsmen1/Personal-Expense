import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:udemy/models/transaction.dart';
import 'package:udemy/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactoinValues {
    return List.generate(7, (index) {
      /*so it first subtracts "6 - 0 =  6", then "6 - 1 = 5",
      ... and ends with subtracting "6 - 6 = 0" which is just "now()"*/
      final weekday = DateTime.now().subtract(Duration(days: 6 - index));
      var totalSum = 0.0;

      /*This For loop method run's till the recenTransactions list length and
      * checking the condition of recentTransation[index].date matches the
      * above weekday date which is recent 7 days , if it matches then
      * looping through all the amount objects it adds all the amount to
      * 'totalsum giving it total amount values of that single day*/
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      /*substring method = it removes letters of a string
      * Example: var string = 'dartlang';
                 string.substring(1);    // 'artlang'
                 string.substring(1, 4); // 'art'*/
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum //total day spending
      };
    });
  }

  //Total spending the amount spent in the whole week
  double get totalSpending {
    return groupedTransactoinValues.fold(0.0, (sum, item){
      return sum+item['amount'];
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10.0 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactoinValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  e['day'],
                  e['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (e['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
