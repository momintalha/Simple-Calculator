import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/widgets/app_button.dart';
import 'package:calculator/views/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/database_service.dart';

class ResultHistoryScreen extends StatelessWidget {
  const ResultHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hisP = Provider.of<HistoryProvider>(context);

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
        builder: (_, provider, _) => ListView.builder(
          itemCount: provider.history.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: (provider.history.isEmpty)
                ? Container()
                : Column(
                    children: [
                      CardTile(
                        calc:
                            '${hisP.history[index][DatabaseService.dbService.cInput]}',
                        res:
                            '= ${hisP.history[index][DatabaseService.dbService.cOutput]}',
                        time:
                            '${hisP.history[index][DatabaseService.dbService.cTime]}',
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
