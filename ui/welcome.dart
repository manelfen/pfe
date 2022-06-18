import 'package:flutter/material.dart';
import 'package:welcome_login/ui/home.dart';
import 'package:welcome_login/ui/proforcust.dart';
import '../constants.dart';


class ShadowDemo extends StatefulWidget {
  const ShadowDemo({Key? key}) : super(key: key);

    @override
    _ShadowDemoState createState() => _ShadowDemoState();
  }

  class _ShadowDemoState extends State<ShadowDemo> {
    final _opacity = 1.0;
    final _xOffset = 0.0;
    final _yOffset = 0.0;
    // var _blurRadius = 0.0;

    @override
    Widget build(BuildContext context) {
      return Stack(
          children: <Widget>[
            Center(
                child: Text(
                  'Pharmmed',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.tealAccent,
                    shadows: [
                      Shadow(
                        color: Colors.teal.shade900.withOpacity(_opacity),
                        offset: Offset(_xOffset, _yOffset),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                )),
          ],
        );
    }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: basicBackground,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo3.png',
                      width: 130,
                    ),
                    const SizedBox(height: 50),
                    ShadowDemo(),
                  ],
                ),
              ),
              Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const ProfOrCust()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Commencer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
