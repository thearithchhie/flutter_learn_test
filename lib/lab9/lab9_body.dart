import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lab9Body extends StatefulWidget {
  const Lab9Body({Key? key}) : super(key: key);

  @override
  State<Lab9Body> createState() => _Lab9BodyState();
}

class _Lab9BodyState extends State<Lab9Body> {
  String f = 'assets/images/acer.jpeg';
  Color c1 = Colors.lightBlue;
  Color c2 = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // width: double.maxFinite,
        // height: double.maxFinite,
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.050,
              child: Image.asset(f, width: 320, height: 400, fit: BoxFit.contain,),
            ),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.050,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: c1,
                    child: const Text('Acer'),
                    onPressed: () {
                      setState(() {
                        f = 'assets/images/acer.jpeg';
                        c1 = Colors.lightBlue;
                        c2 = Colors.blueGrey;
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.034),
                  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: c2,
                    child: const Text('Mac'),
                    onPressed: () {
                      setState(() {
                        f = 'assets/images/mac.jpeg';
                        c1 = Colors.blueGrey;
                        c2 = Colors.lightBlue;
                      });
                    },
                  ),
                ],
              ),
            ),
            // create button clear and remove image
            Positioned(
              top: size.height * 0.5,
              left: 120,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.red,
                child: const Text('Clear'),
                onPressed: () {
                  setState(() {
                    f = "assets/images/acer.jpeg";
                    c1 = Colors.lightBlue;
                    c2 = Colors.blueGrey;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
