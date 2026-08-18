import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String calc;
  final String res;
  final String time;

  const CardTile({
    super.key,
    required this.calc,
    required this.res,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                spacing: 20,
                children: [
                  Icon(Icons.calculate, color: Colors.blue, size: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        calc,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AutoSizeText(
                        res,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nunito',
                      color: Colors.black54,
                    ),
                  ),
                  Icon(Icons.access_time, color: Colors.black54, size: 14),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
