import 'package:first_app/components/my_button.dart';
import 'package:first_app/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num result = 0;
  final enterNumberOneController = TextEditingController();
  final enterNumberTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    enterNumberOneController.text = x.toString();
    enterNumberTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                text: 'Enter First Number',
                controller: enterNumberOneController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                text: 'Enter Second Number',
                controller: enterNumberTwoController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                result.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    ontap: () {
                      setState(() {
                        result = num.tryParse(enterNumberOneController.text)! +
                            num.tryParse(enterNumberTwoController.text)!;
                      });
                    },
                    icon: CupertinoIcons.add,
                  ),
                  MyButton(
                    icon: CupertinoIcons.minus,
                    ontap: () {
                      setState(() {
                        result = num.tryParse(enterNumberOneController.text)! -
                            num.tryParse(enterNumberTwoController.text)!;
                      });
                    },
                  ),
                  MyButton(
                    icon: CupertinoIcons.multiply,
                    ontap: () {
                      setState(() {
                        result = num.tryParse(enterNumberOneController.text)! *
                            num.tryParse(enterNumberTwoController.text)!;
                      });
                    },
                  ),
                  MyButton(
                    icon: CupertinoIcons.divide,
                    ontap: () {
                      setState(() {
                        result = num.tryParse(enterNumberOneController.text)! /
                            num.tryParse(enterNumberTwoController.text)!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                    enterNumberOneController.clear();
                    enterNumberTwoController.clear();
                    result = 0;
                  });
                },
                label: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
