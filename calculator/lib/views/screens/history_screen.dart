import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/widgets/app_button.dart';
import 'package:calculator/views/widgets/card_tile.dart';
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
          AppButton(
            bicon: Icons.delete,
            bColor: Colors.blue,
            onPressed: () {
              hisP.deleteHistory();
            },
          ),
        ],
      ),
      body: Consumer<HistoryProvider>(
        builder: (_, hisP, _) => ListView.builder(
          itemCount: hisP.history.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: (hisP.history.isEmpty)
                ? Container()
                : Column(
                    children: [
                      CardTile(
                        onPressed: () {
                          Navigator.pop(context);
                          calcP.historyBack(
                            hisP.history[index][DatabaseService.cInput],
                            hisP.history[index][DatabaseService.cOutput],
                          );
                        },
                        calc: '${hisP.history[index][DatabaseService.cInput]}',
                        res:
                            '= ${hisP.history[index][DatabaseService.cOutput]}',
                        time: '${hisP.history[index][DatabaseService.cTime]}',
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
