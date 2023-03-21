import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'second.dart';

//void main() => runApp(gemifysign());
void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: gemifysign(),
  ));
}

class gemifysign extends StatefulWidget {
  const gemifysign({Key? key}) : super(key: key);

  @override
  State<gemifysign> createState() => _gemifysignState();
}

class _gemifysignState extends State<gemifysign> {
  File? _image;
  Image myIcon = Image.asset('assets/ad.png');

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade100,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ////for the image adding button
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 135.0,
                  ),
                  InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      radius: 50.0,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: Image(
                        image: AssetImage('images/ad.png'),
                      ),

                      /*IconButton(
                          icon: myIcon,
                          onPressed: null,
                        ),*/
                    ),
                  )
                ],
              ),
              ////image adding button end
              SizedBox(
                height: 20.0,
              ),
              //// sign up and login labels
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ////sign up and login labels end
              SizedBox(
                height: 32.0,
              ),
//username
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              //email
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
//mobile
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              //address
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                  ),
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              //birthday
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.calendar_today),
                  ),
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
              ),

              //password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              //confirm Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                  ),
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //to add social media icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage('images/f.png'),
                      height: 60.0,
                      width: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('images/g.png'),
                      height: 60.0,
                      width: 40.0,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('images/t.png'),
                      height: 60.0,
                      width: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('images/m.png'),
                      height: 60.0,
                      width: 30.0,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
