import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lab9Body extends StatefulWidget {
  const Lab9Body({Key? key}) : super(key: key);

  @override
  State<Lab9Body> createState() => _Lab9BodyState();
}

class _Lab9BodyState extends State<Lab9Body> {
  String firstImage = 'assets/images/acer.jpeg';
  Color colorOne = Colors.lightBlue;
  Color colorTwo = Colors.blueGrey;
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
              child: Image.asset(firstImage, width: 320, height: 400, fit: BoxFit.contain,),
            ),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.050,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: colorOne,
                    child: const Text('Acer'),
                    onPressed: () {
                      setState(() {
                        firstImage = 'assets/images/acer.jpeg';
                        colorOne = Colors.lightBlue;
                        colorTwo = Colors.blueGrey;
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.034),
                  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: colorTwo,
                    child: const Text('Mac'),
                    onPressed: () {
                      setState(() {
                        firstImage = 'assets/images/mac.jpeg';
                        colorOne = Colors.blueGrey;
                        colorTwo = Colors.lightBlue;
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
                    firstImage = "assets/images/acer.jpeg";
                    colorOne = Colors.lightBlue;
                    colorTwo = Colors.blueGrey;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
