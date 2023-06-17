
import 'package:flutter/material.dart';
import "package:math_expressions/math_expressions.dart";

import 'colors.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double outputsize = 55.0;
  var input = '', output = '';
  onButtonClick(value) {
    if (input.startsWith('0')) {
      input = input.substring(0, input.length - 1);
    } else if (value == 'AC') {
      if (input.isNotEmpty) {
        input = '';
        output = '';
      }
    } else if (value == '⌫') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = userinput.replaceAll('x', '*');
        userinput = userinput.replaceAll('÷', '/');
        Parser p = Parser();
        Expression exp = p.parse(userinput);
        ContextModel cm = ContextModel();
        var eval = exp.evaluate(EvaluationType.REAL, cm);
        output = eval.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        outputsize = 70.0;
      }
    } else if (value == '%') {
      if (input.isNotEmpty) {
        var userinput = input;
        Parser p = Parser();
        Expression exp = p.parse(userinput);
        ContextModel cm = ContextModel();
        var eval = exp.evaluate(EvaluationType.REAL, cm);
        output = (eval / 100).toString();
      }
    } else {
      input += value;
      outputsize = 60.0;
    }
    setState(() {});
  }

  Widget button({btnName, bgColor = buttoncolor}) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ElevatedButton(
        onPressed: () => onButtonClick(btnName),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(95, 70),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: bgColor,
        ),
        child: Text(
          btnName,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 118, 113),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(2.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 126, 118, 113),
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        input,
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                            fontSize: outputsize,
                            color: const Color.fromARGB(244, 250, 248, 248)),
                      ),
                    ]),
              ),
            ),
            Row(
              children: [
                button(
                  btnName: "AC",
                  bgColor: rawButtoncolor,
                ),
                button(
                  btnName: "+/-",
                  bgColor: rawButtoncolor,
                ),
                button(
                  btnName: "%",
                  bgColor: rawButtoncolor,
                ),
                button(
                  btnName: "÷",
                  bgColor: operatorcolor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  btnName: "7",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "8",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "9",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "x",
                  bgColor: operatorcolor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  btnName: "4",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "5",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "6",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "-",
                  bgColor: operatorcolor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  btnName: "1",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "2",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "3",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "+",
                  bgColor: operatorcolor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  btnName: "0",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: ".",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "⌫",
                  bgColor: buttoncolor,
                ),
                button(
                  btnName: "=",
                  bgColor: operatorcolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
