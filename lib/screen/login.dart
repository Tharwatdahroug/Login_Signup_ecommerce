import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './signup.dart';

class login extends StatefulWidget {
  @override
  static const routeName = '/login';

  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool _showsee = true;
  bool _notshowsee = false;
  final _paswordFocusenode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _loginData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  void dispose() {
    _paswordFocusenode.dispose();

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
                  height: deviceSize.height / 2,
                  width: deviceSize.width,
                  child: Image.network(
                    'https://www.logopik.com/wp-content/uploads/edd/2018/07/Ecommerce-Logo-Vector.png',
                  ),
                ),
              ),
              Flexible(
                flex: deviceSize.height > 535 ? 2 : 1,
                child: Container(
                  // height: deviceSize.height,
                  width: deviceSize.width,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Card(
                          color: Color.fromRGBO(229, 100, 42, 1),
                          elevation: 5,
                          child: TextFormField(
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
                              hintText: "Enter  Email",
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
                          height: 20.0,
                        ),
                        Card(
                          color: Color.fromRGBO(18, 161, 74, 1),
                          elevation: 5,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            obscureText: _showsee,
                            focusNode: _paswordFocusenode,
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
                              hintText: "Enter  Password",
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
                        Container(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: () => print("for"),
                            padding: EdgeInsets.only(right: 0.0),
                            child: Text(
                              "Forget password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                            elevation: 0.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (_isLoading)
                          CircularProgressIndicator()
                        else
                          RaisedButton(
                            child: Text("LOGIN"),
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
                          child: Text('SIGNUP'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(sigup.routeName);
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
