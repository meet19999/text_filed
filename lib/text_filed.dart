import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController testController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: testController,
                textAlign: TextAlign.center,
                // cursorColor: Colors.black,
                cursorHeight: 20,
                cursorRadius: const Radius.circular(20),
                cursorWidth: 3,
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.words,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                autocorrect: false,
                autofocus: false,
                // expands: true,
                minLines: 1,
                maxLines: 2,
                enabled: true,
                onTap: () {
                  debugPrint("On Tab -------->>> ");
                },
                onChanged: (value) {
                  debugPrint("On Change -------->>> $value");
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter value";
                  } else if (value != "1234") {
                    testController.clear();
                    return "Please enter 1234";
                  }
                  return "";
                },
                maxLength: 6,
                decoration: InputDecoration(
                  // hintText: "Email",
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                  counterText: "",
                  // focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 0,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 0,
                  ),
                  label: const Text("Email"),
                  filled: false,
                  fillColor: Colors.red,
                  prefix: const Icon(Icons.real_estate_agent),
                  suffix: const Icon(Icons.radar_sharp),
                  icon: const Icon(Icons.access_alarms_sharp),
                ),
              ),
              const SizedBox(height: 30),
              Text(testController.text),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formKey.currentState!.validate();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
