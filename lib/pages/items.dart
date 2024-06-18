import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class items_page extends StatefulWidget {
  const items_page({super.key});

  @override
  State<items_page> createState() => _items_pageState();
}

class _items_pageState extends State<items_page> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _discription, _categoryCode, _baseUnitMeasure, _shelfNo, _unitVolume , _invetory, _stockoutWarning;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Items apage"),
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
            'Item listed',
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
                'Add New Item',
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
      height: MediaQuery.of(context).size.height * 0.8,
      width: _deviceWidth,// 80% of device height
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _addSaccoForm(),
            _addItemButton(),

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
              const SizedBox(height: 26),
              _titleWidget(),
              const SizedBox(height: 26),
              _discriptionTextField(),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _CategoryCodeTextField()),
                  const SizedBox(width: 10), // Add a space between the two text fields
                  Expanded(child: _BaseUnitofMeasureTextField()),
                ],
              ),
              const SizedBox(height: 26),

              Row(

                children: [
                  Expanded(child:   _textWidget(),),
                  const SizedBox(width: 10), // Add a space between the two text fields

                ],
              ),
              const SizedBox(height: 2),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _shelfNoTextField()),
                  const SizedBox(width: 10), // Add a space between the two text fields
                  Expanded(child: _unitVolumeTextField()),
                ],
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _invetoryTextField()),
                  const SizedBox(width: 10), // Add a space between the two text fields
                  Expanded(child: _stockOutWarningTextField()),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget(){
    return const Text(
      "Add Item",
      style: TextStyle(
        fontSize: 42,
        color:  Colors.grey,
        fontWeight: FontWeight.w900,
      ),
    );
  }
  Widget _textWidget(){
    return const Text(
      "Inventory",
      style: TextStyle(
        fontSize: 22,
        color:  Colors.grey,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _discriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Description",
        labelText: "Description",
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
          _discription = _value;
        });
      },
    );
  }
  Widget _CategoryCodeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Category code",
        labelText: "Category code",
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
          _categoryCode = _value;
        });
      },
    );
  }
  Widget _BaseUnitofMeasureTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Base unit of measure",
        labelText: "Base unit of measure",
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
          _baseUnitMeasure = _value;
        });
      },
    );
  }

  Widget _shelfNoTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Shelf No",
        labelText: "Shelf No",
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
          return 'Please enter the shelf number';
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
          _shelfNo = _value;
        });
      },
    );
  }
  Widget _unitVolumeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Unit Volume",
        labelText: "Unit Volume",
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
          return 'Please enter the Unit volume';
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
          _unitVolume = _value;
        });
      },
    );
  }
  Widget _invetoryTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Inventory",
        labelText: "Inventory",
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
      validator: (_value) => _value!.length > 0 ? null : "Please enter the inventory",
      onSaved: (_value) {
        setState(() {
          _invetory = _value;
        });
      },
    );
  }
  Widget _stockOutWarningTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Stock out warning",
        labelText: "Stock out warning",
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
      validator: (_value) => _value!.length > 0 ? null : "Please enter the stock out warning",
      onSaved: (_value) {
        setState(() {
          _stockoutWarning = _value;
        });
      },
    );
  }

  Widget _addItemButton(){
    return MaterialButton(
        onPressed: _addmember,
        minWidth: _deviceWidth! * 0.9,
        height: _deviceHeight! * 0.06,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // adjust the value as needed
        ),
        child: const Text("Add Item",
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
