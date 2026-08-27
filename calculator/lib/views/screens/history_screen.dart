import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculator/services/database_service.dart';
import 'package:provider/provider.dart';

class ResultHistoryScreen extends StatelessWidget {
  const ResultHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hisP = Provider.of<HistoryProvider>(context);
    var calcP = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontFamily: 'Montono', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              hisP.deleteHistory();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Consumer<HistoryProvider>(
        builder: (_, hisP, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 1,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: hisP.history.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: (hisP.history.isEmpty)
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(
                            'No data yet',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            calcP.historyBack(
                              hisP.history[index][DatabaseService.cInput],
                              hisP.history[index][DatabaseService.cOutput],
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${hisP.history[index][DatabaseService.cInput]}',
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.right,
                                softWrap: true,
                              ),
                              Text(
                                '= ${hisP.history[index][DatabaseService.cOutput]}',
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.right,
                                softWrap: true,
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              height: 0.5,
              thickness: 0.5,
              indent: 24,
              endIndent: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    calcP.input,
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                  Text(
                    '= ${calcP.output}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
