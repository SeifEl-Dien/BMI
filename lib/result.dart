import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myresult extends StatelessWidget {
  const Myresult(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultphrase {
    String resulttext = '';
    if (result >= 30)
      resulttext = 'Obese';
    else if (result > 25 && result < 30)
      resulttext = 'Overweight';
    else if (result >= 18.5 && result <= 25)
      resulttext = 'Normal';
    else
      resulttext = 'Thin';

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text('Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline3),
            Text('Healthiness: $resultphrase',
                style: Theme.of(context).textTheme.headline3),
            Text('Age: $age', style: Theme.of(context).textTheme.headline3),
          ],
        ),
      )),
    );
  }
}
