import 'package:calculator/viewmodels/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculator/views/widgets/about_tile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Container(
        padding: EdgeInsets.only(top: 44, left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
          gradient: LinearGradient(
            colors: [Color(0xfffff1eb), Color(0xffe7f0fd)],
          ),
        ),
        child: Column(
          spacing: 24,
          children: [
            AboutTile(
              icon: 'assets/icons/icons_app-512.png',
              iSize: 50,
              iconBackgroundColor: Color(0xfffff1eb),
              title: 'Calculator',
              subtitle: 'Simple. Fast. Accurate.',
              titleTextStyle: TextStyle(
                color: Colors.blue,
                fontSize: 35,
                fontFamily: 'Montono',
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.black12,
              height: 0.5,
              thickness: 0.5,
              indent: 20,
              endIndent: 28,
            ),
            AboutTile(
              icon: 'assets/icons/icons-version-50.png',
              iSize: 30,
              iconBackgroundColor: Color(0xfff6e5f4),
              title: 'Version 1.0',
              subtitle: 'Built with Flutter',
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Montono',
                fontWeight: FontWeight.w600,
              ),
            ),

            AboutTile(
              icon: 'assets/icons/icons-copyright-48.png',
              iSize: 30,
              iconBackgroundColor: Color(0xffe3f9f0),
              title: 'Copyright ⓒ 2026',
              subtitle: 'All rights reserved.',
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Montono',
                fontWeight: FontWeight.w600,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white, width: 0.1),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  AboutTile(
                    icon: 'assets/icons/icons-message-48.png',
                    iSize: 40,
                    iconBackgroundColor: Color(0xffeafdef),
                    title: 'Support',
                    subtitle:
                        'Please leave questions, \ncomments or report bugs 🙂',
                    titleTextStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontFamily: 'Montono',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutTile(
                          icon: 'assets/icons/icons-email-48.png',
                          iSize: 30,
                          iconBackgroundColor: Color(0xffc9f2ea),
                          title: 'Email',
                          subtitle: 'mominpasha302@gmail.com',
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Montono',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: InkWell(
                            onTap: () async {
                              await CalculatorProvider().copyText(
                                data: 'mominpasha302@gmail.com',
                              );

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/icons-copy-24.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutTile(
                          icon: 'assets/icons/icons-tiktok-50.png',
                          iSize: 30,
                          iconBackgroundColor: Color(0xffc0d0d6),
                          title: 'TikTok',
                          subtitle: '@appdev404',
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Montono',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: InkWell(
                            onTap: () async {
                              await CalculatorProvider().copyText(
                                data: '@appdev404',
                              );

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/icons-copy-24.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AboutTile(
              icon: 'assets/icons/icons-heart-48.png',
              iSize: 30,
              iconBackgroundColor: Color(0xffe5d7e0),
              title: 'Thankyou for using Calculator!',
              subtitle: 'Made with ❤️ and lots of ☕️',
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Montono',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
