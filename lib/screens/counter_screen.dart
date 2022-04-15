import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text('Clicks counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        resetFn: reset,
        decreaseFn: decrease,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function resetFn;
  final Function decreaseFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.resetFn,
    required this.decreaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn(),
          //onPressed: () => setState(() => counter++),
        ),
        //const SizedBox(
        //width: 30,
        //),
        FloatingActionButton(
          child: const Icon(Icons.replay_outlined),
          onPressed: () => resetFn(),
          //onPressed: () => setState(() => counter = 0),
        ),
        //const SizedBox(
        // width: 30,
        // ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn(),
          //onPressed: () => setState(() => counter--),
        )
      ],
    );
  }
}
