import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SaccolistPage extends StatefulWidget {
  const SaccolistPage({super.key});

  @override
  State<SaccolistPage> createState() => _SaccolistPageState();
}

class _SaccolistPageState extends State<SaccolistPage> {
  String? _sacconame, _manager, _district, _lastno , _regDate, _regNO;
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
 appBar: AppBar(
   backgroundColor: Colors.grey,
   title: const Text("Sacco listed here"),
 ),
body: SafeArea(
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
    child:  Center(
      child: Column(

          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            _firstItem2()
          ]
      ),
    ),
  ),
),
    );
  }


  Widget _firstItem2(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {}, // Add your onPressed methods here
          child: const Text(
            'Sacco',
            style: TextStyle(
              fontSize: 20, // adjust as needed
              fontWeight: FontWeight.bold, // adjust as needed
              color: Colors.blue, // adjust as needed
            ),
          ),
        ),
        Row(
          children: <Widget>[

            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return _showMaterialModalBottomSheet(); // Replace with your form widget
                  },
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text(
                'Add New Sacco',
                style: TextStyle(
                  fontSize: 20, // adjust as needed
                  fontWeight: FontWeight.bold, // adjust as needed
                  color: Colors.white, // adjust as needed
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _showMaterialModalBottomSheet() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7, // 80% of device height
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _addSaccoForm(),
              _addSaccoButton(),
              const SizedBox(height: 200.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addSaccoForm() {
    return Container(
      padding: const EdgeInsets.all(16.0), // Add padding if needed
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _sacconameTextField(),
              const SizedBox(height: 32.0),
              _managerTextField(),
              const SizedBox(height: 32.0),
              _districtTextField(),
              const SizedBox(height: 32.0),
              _lastNOTextField(),
              const SizedBox(height: 32.0),
              _regNOTextField(),
              const SizedBox(height: 32.0),
              _dateOfRegTextField(),


            ],
          ),
        ),
      ),
    );
  }


  Widget _titleWidget(){
    return const Text(
      "Add Another Sacco",
      style: TextStyle(
        fontSize: 42,
        color:  Colors.grey,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _sacconameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Sacco Name",
        labelText: "Sacco Name",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: (_value) => _value!.length > 0 ? null : "Please enter the name",
      onSaved: (_value) {
        setState(() {
          _sacconame = _value;
        });
      },
    );
  }
  Widget _managerTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Manager Name",
        labelText: "Manager Name",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: (_value) => _value!.length > 0 ? null : "Please enter the name",
      onSaved: (_value) {
        setState(() {
          _manager = _value;
        });
      },
    );
  }

  Widget _districtTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "District",
        labelText: "District",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: (_value) => _value!.length > 0 ? null : "Please enter the  district name",
      onSaved: (_value) {
        setState(() {
          _district = _value;
        });
      },
    );
  }
  Widget _lastNOTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "last Number",
        labelText: "last Number",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onSaved: (_value) {
        setState(() {
          _lastno = _value;
        });
      },
      keyboardType: TextInputType.phone,
      validator: (_value) {
        bool _results = _value!.contains(RegExp(r'^\+?[1-9]\d{1,14}$')); // Validates international phone number
        return _results ? null : "Invalid Number";
      },
    );
  }
  Widget _regNOTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Registration Number",
        labelText: "Registration Number",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onSaved: (_value) {
        setState(() {
          _regNO = _value;
        });
      },
      keyboardType: TextInputType.phone,
      validator: (_value) {
        bool _results = _value!.contains(RegExp(r'^\+?[1-9]\d{1,14}$')); // Validates international phone number
        return _results ? null : "Invalid Number";
      },
    );
  }
  final TextEditingController _dateController = TextEditingController();
  Widget _dateOfRegTextField() {
    return TextFormField(
      controller: _dateController,
      decoration: InputDecoration(
        hintText: " Registration Date",
        labelText: "Registration Date",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        // ...
      ),
      readOnly: true,
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          setState(() {
            _regDate = formattedDate;
            _dateController.text = formattedDate;
          });
        }
      },
      // ...
    );
  }

  Widget _addSaccoButton(){
    return MaterialButton(
        onPressed: _addSacco,
        minWidth: _deviceWidth! * 0.9,
        height: _deviceHeight! * 0.06,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // adjust the value as needed
        ),
        child: const Text("Add Sacco",
          style: TextStyle(color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        )
    );
  }
  _addSacco(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print("validated");
    }
  }
}
