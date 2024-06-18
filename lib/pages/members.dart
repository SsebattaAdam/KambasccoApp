import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fname, _lname,  _gender, _currentSavings, _sharepercentage, _currentsharevalue, _networth ;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Sacco Members listed here"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child:  Center(
            child: Column(

                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  _firstItem1()
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstItem1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {}, // Add your onPressed methods here
          child: const Text(
            'Member List',
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
                'Add New Member',
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.8, // 80% of device height
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleWidget(),
            _addSaccoForm(),
            _addSaccoButton(),
          ],
        ),
      ),
    );
  }

  Widget _addSaccoForm() {
    return Container(
      height: _deviceHeight! * 0.6,
      padding: const EdgeInsets.all(16.0), // Add padding if needed
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _firstTextField(),
               const SizedBox(height: 16.0),
              _lastTextField(),
              const SizedBox(height: 16.0),
              _genderTextField(),
              const SizedBox(height: 16.0),
              _currentSavingsTextField(),
              const SizedBox(height: 16.0),
              _sharepercentagetSavingsTextField(),
              const SizedBox(height: 16.0),
              _currentshareValueTextField(),
              const SizedBox(height: 16.0),
              _NetworthyTextField(),
              const SizedBox(height: 150.0),
          
            ],
          ),
        ),
      ),
    );
  }


  Widget _titleWidget(){
    return const Text(
      "Add Sacco Member",
      style: TextStyle(
        fontSize: 42,
        color:  Colors.grey,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _firstTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "First Name",
        labelText: "First Name",
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
          _fname = _value;
        });
      },
    );
  }
  Widget _lastTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "last Name",
        labelText: "last Name",
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
          _lname= _value;
        });
      },
    );
  }
  Widget _genderTextField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Gender",
        labelText: "Gender",
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
      items: <String>['Male', 'Female'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _gender = newValue;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please select a gender';
        }
        return null;
      },
      onSaved: (String? value) {
        setState(() {
          _gender = value;
        });
      },
    );
  }
  Widget _currentSavingsTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Current Savings",
        labelText: "Current Savings",
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
      keyboardType: TextInputType.numberWithOptions(decimal: true), // Set keyboard type to number
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return 'Please enter the current savings';
        }
        try {
          double.parse(_value);
        } catch (e) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (_value) {
        setState(() {
          _currentSavings = _value;
        });
      },
    );
  }
  // Create a TextEditingController
  final TextEditingController _sharePercentageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller
    _sharePercentageController.addListener(() {
      String text = _sharePercentageController.text;

      // If the text does not end with a percentage symbol, append it
      if (text.isNotEmpty && !text.endsWith('%')) {
        _sharePercentageController.text = text + '%';
        _sharePercentageController.selection = TextSelection.fromPosition(TextPosition(offset: _sharePercentageController.text.length - 1));
      }
    });
  }

  Widget _sharepercentagetSavingsTextField() {
    return TextFormField(
      controller: _sharePercentageController, // Use the controller
      decoration: InputDecoration(
        hintText: "Share Percentage",
        labelText: "Share Percentage",
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
      keyboardType: TextInputType.numberWithOptions(decimal: true), // Set keyboard type to number
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return 'Please enter the share percentage';
        }
        try {
          // Remove the percentage symbol before parsing
          double.parse(_value.replaceAll('%', ''));
        } catch (e) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (_value) {
        setState(() {
          // Remove the percentage symbol before saving
          _sharepercentage = _value?.replaceAll('%', '');
        });
      },
    );
  }
  Widget _currentshareValueTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Current Share value",
        labelText: "Current Share value",
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
      keyboardType: TextInputType.numberWithOptions(decimal: true), // Set keyboard type to number
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return 'Please enter the current share value';
        }
        try {
          double.parse(_value);
        } catch (e) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (_value) {
        setState(() {
          _currentsharevalue = _value;
        });
      },
    );
  }

  Widget _NetworthyTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Net Worthy",
        labelText: "Net Worthy",
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
      keyboardType: TextInputType.numberWithOptions(decimal: true), // Set keyboard type to number
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return 'Please enter the net worthy';
        }
        try {
          double.parse(_value);
        } catch (e) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: (_value) {
        setState(() {
          _networth = _value;
        });
      },
    );
  }
  Widget _addSaccoButton(){
    return MaterialButton(
        onPressed: _addmember,
        minWidth: _deviceWidth! * 0.9,
        height: _deviceHeight! * 0.06,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // adjust the value as needed
        ),
        child: const Text("Add Member",
          style: TextStyle(color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        )
    );
  }
  _addmember(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print("validated");
    }
  }

}
