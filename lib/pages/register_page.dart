import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_Page extends StatefulWidget {
   const Register_Page({super.key});


  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password, _name, _phone;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _registerForm(),
                _registerButton(),
                _loginPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget(){
    return const Text(
      "Register",
      style: TextStyle(
        fontSize: 42,
        color:  Colors.grey,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _registerForm(){
    return Container(
      height: _deviceHeight! * 0.4,
      child: Form(
        key: _formKey,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailTextField(),
            _phoneNumberTextField(),
            passwordTextField(),

          ],
        ),
      ),
    );
  }
  Widget _nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Name",
        labelText: "Name",
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
          _name = _value;
        });
      },
    );
  }
  Widget _emailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        labelText: "Email",
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
      onSaved: (_value){
        setState(() {
          _email = _value;
        });
      },
      keyboardType: TextInputType.emailAddress,
      validator: (_value){
        bool _results = _value!.contains(RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$'));
        return _results? null : "Invalid Email";
      },
    );
  }
  Widget passwordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        labelText: "Password",
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
      onSaved: (_value){
        setState(() {
          _password = _value;
        });
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (_value){
        bool _results = _value!.length > 6;
        return _results? null : "Password must be more than 6 characters";
      },
    );
  }
  Widget _phoneNumberTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Phone Number",
        labelText: "Phone Number",
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
          _phone = _value;
        });
      },
      keyboardType: TextInputType.phone,
      validator: (_value) {
        bool _results = _value!.contains(RegExp(r'^\+?[1-9]\d{1,14}$')); // Validates international phone number
        return _results ? null : "Invalid Phone Number";
      },
    );
  }
  Widget _registerButton(){
    return MaterialButton(
      onPressed: _RegisterUser,
      minWidth: _deviceWidth! * 0.9,
      height: _deviceHeight! * 0.06,
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // adjust the value as needed
      ),
      child: const Text("Register",
    style: TextStyle(color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    ),
    )
    );
  }
  Widget _loginPageLink(){
    return TextButton(
      onPressed: (){
        Navigator.pushNamed(context, 'login');
      },
      child: const Text("Already have an Account? Login"),
    );
  }

  _RegisterUser(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print("validated");
      Navigator.pushNamed(context, 'home');
    }
  }
}
