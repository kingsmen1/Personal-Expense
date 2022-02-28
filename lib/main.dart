import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:udemy/widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(buttonColor: Colors.purple),
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'Opensans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Opensans',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: "t1",
    //     amount: 9.22,
    //     date: DateTime.now()),
  ];

  bool showChart = false;

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDatee) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: selectedDatee,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (_) {
          //return NewTransaction(_addNewTransaction);
          return SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: NewTransaction(_addNewTransaction),
          ));
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((e) => e.id == id);
    });
  }

  /* This get(Dynamically calculated property) _recentTransactions Method
 * gets only the recent 7 days transactions from the userTransactions
 * by using "where((){return ; })"  = method which allow us to run a function
 * for every item in a list and if the function/Conditoin is true it is kept in
 * a newly returned list otherwise it is not included in that list.
 * remeber "where" return a itterable not a list so add .toList() to covert it
 * to list*/
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  List<Widget> _buildLandScapeContent(
      MediaQueryData mediaQuery, AppBar appbar, Widget txList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Charrt',
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch.adaptive(
              activeColor: Theme.of(context).accentColor,
              value: showChart,
              onChanged: (val) {
                setState(() {
                  showChart = val;
                });
              })
        ],
      ),
      showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appbar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransactions))
          : txList
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appbar, Widget txList) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  appbar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: Chart(_recentTransactions)),
      txList
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appbar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Flutter App'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Flutter App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );
    final txList = Container(
        height: (mediaQuery.size.height -
                appbar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child:
            TransactionList(_userTransactions, _deleteTransaction, mediaQuery));
    final body = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (isLandscape)
            ..._buildLandScapeContent(mediaQuery, appbar, txList),
          if (!isLandscape)
            ..._buildPortraitContent(mediaQuery, appbar, txList),
        ],
      ),
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            navigationBar: appbar,
          )
        : Scaffold(
            appBar: appbar,
            body: body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
