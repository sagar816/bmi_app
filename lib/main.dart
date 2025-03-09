import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 250, 251, 253)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController =
      TextEditingController(); //make controller global so that you can access it from anywhere
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
              child: Text(
            "Calculate Your BMI",
            style: TextStyle(
                color: Color.fromARGB(255, 3, 51, 75),
                fontWeight: FontWeight.bold),
          )),
        ),
        body: Container(
          color: bgColour,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 21,
                  ),
                  // const Text(
                  //   "BMI",
                  //   style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  // ),
                  const Text(
                    "Body Mass Index",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text("Enter Your Weight(in kgs)"),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text("Enter Your Height(in feet)"),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text("Enter Your Height(in Inch)"),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 18),

                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //to check field empty
                        // BMI Calculation

                        var iWt = int.parse(wt); //convert to int
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;

                        var tCm = tInch * 2.54;

                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);

                        var msg = '';

                        if (bmi > 25) {
                          msg = "You're OverWeight!!";
                          bgColour = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You're UnderWeight";
                          bgColour = Colors.red.shade200;
                        } else {
                          msg = "You're Healthy";
                          bgColour = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "\nPlease fill all the fields";
                        });
                      }
                    },
                    child: Text("Calculate"),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    result,
                    style: TextStyle(
                        fontSize: 29, color: Color.fromARGB(255, 13, 31, 233)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


//17.52