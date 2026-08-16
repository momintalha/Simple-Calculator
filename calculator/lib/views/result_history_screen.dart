import 'package:calculator/viewmodels/history_provider.dart';
import 'package:calculator/views/widgets/app_button.dart';
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
        automaticallyImplyLeading: false,
        leading: AppButton(
          bShape: Icons.arrow_back,
          bColor: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'History',
          style: TextStyle(fontFamily: 'Montono', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          AppButton(
            bShape: Icons.delete,
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
          itemBuilder: (context, index) => Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              (provider.history.isEmpty)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            tileColor: Colors.white,
                            iconColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            leading: Icon(Icons.calculate),
                            title: Text(
                              hisP
                                  .history[index][DatabaseService
                                      .dbService
                                      .cInput]
                                  .toString(),
                            ),
                            titleTextStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: Text(
                              '= ${hisP.history[index][DatabaseService.dbService.cOutput]}',
                            ),
                            subtitleTextStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                            trailing: Row(
                              spacing: 2,
                              children: [
                                Text(
                                  '${hisP.history[index][DatabaseService.dbService.cTime]}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                    color: Colors.black54,
                                  ),
                                ),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.black54,
                                  size: 8,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
