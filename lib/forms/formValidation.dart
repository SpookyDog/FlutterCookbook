import 'package:flutter/material.dart';

class FormValidation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode;
  final myController = TextEditingController();
  final myOtherController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myController.addListener(_copyText);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();

    super.dispose();
  }

  _copyText() {
    myOtherController.text = "First text field: ${myController.text}";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            focusNode: myFocusNode,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter some Text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                )
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0
            ),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0
            ),
            child: TextField(
              controller: myOtherController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                } else {
                  FocusScope.of(context).requestFocus(myFocusNode);
                }
              },
              child: Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  }
                );
              },
              child: Icon(Icons.text_fields),
            ),
          ),
        ],
      ))
    );
  }
}