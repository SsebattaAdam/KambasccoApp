import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Kambascco',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 45,
              color: Colors.white
          ),
        ),
        centerTitle: true, // This centers the title
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        flexibleSpace: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.2),
          child: Container(),
        ),
      ),


        body: SafeArea(
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                _titleWidget(),
                _loginForm(),
                const SizedBox(height: 50),
                _loginbutton(),
                const SizedBox(height: 26,),
                _forgotPassword(),

                const SizedBox(height: 26,),
                _registerPageLink(),
                const SizedBox(height: 26,),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _loginForm(){
    return Container(
      height: _deviceHeight! * 0.2,
      child: Form(
        key: _formKey,
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emailTextField(),
              const SizedBox(height: 26,),
              passwordTextField(),
              const SizedBox(height: 26,),

            ],
          ),
        ),

      ),
    );
  }
  Widget _emailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        labelText: "Email",
        focusedBorder: OutlineInputBorder(
          borderSide: const  BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
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
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:   const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const  BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const  BorderSide(color: Colors.red, width: 2.0),
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
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 6.0), // Add padding to move the text from the edge of the screen
      child: const Text(
        "welcome back",
        style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
  Widget _loginbutton(){
    return MaterialButton(
      onPressed: _loginUser,
      minWidth: _deviceWidth! * 0.9,
      height: _deviceHeight! * 0.06,
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // adjust the value as needed
      ),
      child: const Text("Login", style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      ),
    );
  }

  Widget _registerPageLink(){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'register');
      },
      child: const Text(
        "New to Kambascco? Sign up",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
    );

}
  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'register');
        },
        child: const Text(
          "Forgot password",
          style: TextStyle(

            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }



  _loginUser(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print("Email: $_email");
      print("Password: $_password");
      Navigator.pushNamed(context, 'home');
    }
  }
}
