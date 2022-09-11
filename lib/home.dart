import 'package:flutter/material.dart';
import 'package:udemy_bmi/result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightval = 150;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    m1method(context, Icon(Icons.male, size: 90), 'Male'),
                    SizedBox(
                      width: 15,
                    ),
                    m1method(context, Icon(Icons.female, size: 90), 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('${heightval.toInt()}',
                              style: Theme.of(context).textTheme.headline2),
                          Text('cm',
                              style: Theme.of(context).textTheme.headline3)
                        ],
                      ),
                      Slider(
                          min: 80,
                          max: 220,
                          value: heightval,
                          onChanged: (newval) {
                            setState(() {
                              heightval = newval;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    m2method(context, 'Weight', '$weight'),
                    SizedBox(
                      width: 15,
                    ),
                    m2method(context, 'Age', '$age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 13,
              child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightval / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Myresult(
                              result: result, isMale: isMale, age: age),
                        ));
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.headline3,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1method(BuildContext context, Icon mf, String fm) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            isMale = (fm == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && fm == 'Male') || (!isMale && fm == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mf,
              SizedBox(
                height: 15,
              ),
              Text(
                fm,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2method(BuildContext context, String waType, String waNum) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              waType,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              waNum,
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: waType == 'Weight' ? 'Weight--' : 'Age--',
                  onPressed: () {
                    setState(() {
                      waType == 'Weight' ? weight-- : age--;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                  mini: true,
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  heroTag: waType == 'Weight' ? 'Weight++' : 'Age++',
                  onPressed: () {
                    setState(() {
                      waType == 'Weight' ? weight++ : age++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                  ),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
