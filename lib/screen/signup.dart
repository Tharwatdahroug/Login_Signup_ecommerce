import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screen/login.dart';

class sigup extends StatefulWidget {
  @override
  static const routeName = '/sigup';
  _sigupState createState() => _sigupState();
}

class _sigupState extends State<sigup> {
  bool _showsee = true;
  bool _notshowsee = false;
  final _emailFocusenode = FocusNode();
  final _paswordFocusenode = FocusNode();
  final _confirmpaswordFocusenode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _loginData = {
    'email': '',
    'name': '',
    'password': '',
  };
  var _isLoading = false;
  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _confirmpaswordFocusenode.dispose();
    _paswordFocusenode.dispose();
    _emailFocusenode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: deviceSize.height * 0.89,
                  width: deviceSize.width,
                  child: Image.network(
                    'https://www.logopik.com/wp-content/uploads/edd/2018/07/Ecommerce-Logo-Vector.png',
                  ),
                ),
              ),
              Flexible(
                flex: deviceSize.width > 100 ? 2 : 1,
                child: Container(
                  // height: deviceSize.height,
                  width: deviceSize.width,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Card(
                          margin: EdgeInsets.all(10),
                          color: Color.fromRGBO(18, 161, 74, 1),
                          elevation: 5,
                          child: TextFormField(
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusenode);
                            },
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              prefixStyle: TextStyle(color: Colors.white),
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                            },
                            onSaved: (value) => _loginData['name'] = value,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          color: Color.fromRGBO(229, 100, 42, 1),
                          elevation: 5,
                          child: TextFormField(
                            focusNode: _emailFocusenode,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_paswordFocusenode);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              prefixStyle: TextStyle(color: Colors.white),
                              hintText: "Enter your Email",
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                            },
                            onSaved: (value) {
                              _loginData['email'] = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          color: Color.fromRGBO(18, 161, 74, 1),
                          elevation: 5,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            obscureText: _showsee,
                            focusNode: _paswordFocusenode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_confirmpaswordFocusenode);
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              suffixIcon: _showsee
                                  ? IconButton(
                                      icon: Icon(Icons.remove_red_eye,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _showsee = _notshowsee;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.remove_red_eye_outlined,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _showsee = true;
                                        });
                                      },
                                    ),
                              prefixStyle: TextStyle(color: Colors.white),
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) {
                              _loginData['password'] = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          color: Color.fromRGBO(229, 100, 42, 1),
                          elevation: 5,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            obscureText: _showsee,
                            focusNode: _confirmpaswordFocusenode,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              suffixIcon: _showsee
                                  ? IconButton(
                                      icon: Icon(Icons.remove_red_eye,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _showsee = _notshowsee;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.remove_red_eye_outlined,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _showsee = true;
                                        });
                                      },
                                    ),
                              prefixStyle: TextStyle(color: Colors.white),
                              hintText: " Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                            },
                            onSaved: (value) {
                              _loginData['password'] = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (_isLoading)
                          CircularProgressIndicator()
                        else
                          RaisedButton(
                            child: Text('SIGNUP'),
                            onPressed: _submit,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 8.0),
                            color: Colors.orange,
                            textColor:
                                Theme.of(context).primaryTextTheme.button.color,
                          ),
                        FlatButton(
                          child: Text('LOGIN'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(login.routeName);
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 4),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          textColor: Color.fromRGBO(18, 161, 74, 1),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ]),
    );
  }
}
