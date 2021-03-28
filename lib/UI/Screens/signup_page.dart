import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _Submit() {
    final isValid = _formKey.currentState.validate();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = new TextEditingController();
  TextEditingController nicknameTextController = new TextEditingController();
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController phonenumberTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  TextEditingController confirmpasswordTextController =
      new TextEditingController();
  String name, nickname, email, password, confirmpassword;
  bool passmatch = true;
  var phonenumber;

  void handleClick(String value) {
    switch (value) {
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "OOPS :(",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "Seems like you have to create an account. It's free though !",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: MyBullet()),
                          Expanded(
                            flex: 10,
                            child: Text(
                              "Enables you to register with Doctors and Support Groups",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(child: MyBullet()),
                          Expanded(
                              flex: 10,
                              child: Text(
                                "Bookmark content in Library",
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nameTextController,
                        decoration: InputDecoration(
                            hintText: " * If you don't mind / Optional"),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Nickname/Username:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nicknameTextController,
                        decoration: InputDecoration(
                            hintText:
                                " * Do not make it similar to your own name"),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Email Address:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: emailTextController,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Phone Number:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: phonenumberTextController,
                        decoration: InputDecoration(hintText: " * Optional"),
                        validator: (value) {
                          if (value.length != 10) {
                            return 'Invalid Phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Password:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: passwordTextController,
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Confirm Password:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: confirmpasswordTextController,
                      ),
                    ],
                  ),
                ),
              ),
              if (!passmatch)
                Container(
                  child: Text(
                    "The passwords does not match",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    name = nameTextController.text;
                    nickname = nicknameTextController.text;
                    email = emailTextController.text;
                    phonenumber = phonenumberTextController.text;
                    password = passwordTextController.text;
                    confirmpassword = confirmpasswordTextController.text;
                    print(name);
                    print(nickname);
                    print(email);
                    print(phonenumber);
                    print(password);
                    print(confirmpassword);
                    setState(() {
                      if (password != confirmpassword) {
                        passmatch = false;
                      } else {
                        passmatch = true;
                      }
                    });
                    _Submit();
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text("Sign Up for Free"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
