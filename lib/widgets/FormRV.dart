import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bezierContainer.dart';
import '../bezierdownContainer.dart';
import 'Formation_wid.dart';
import 'package:intl/intl.dart';//Import intl in the file this is being done

class FormRV extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormRVState();
  }
}

class FormRVState extends State<FormRV> {
  late String _name;
  late String _email;
  late String _lastname;
  late String _phoneNumber;
  List<String> items = [
    'PECB_ISO_27001_Lead_Implementer ',
    'PECB_ISO_27001_Lead_Auditor',
    'PECB_ISO_27005_Risk_Manager'
  ];
  String? selectedItem = 'PECB_ISO_27001_Lead_Implementer ';
  DateTime date = DateTime(2022,05,08);
  DateTime selectedDate = DateTime.now();
  //TextEditingController _date = new TextEditingController();
   Timestamp? _date;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

          ),
          SizedBox(
            height: 10,
          ),
          TextField(

              onChanged: (value) {
                _name = value;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _buildEmail(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

          ),
          SizedBox(
            height: 10,
          ),
          TextField(

              onChanged: (value) {
                _email = value;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }


  Widget _buildlastname(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

          ),
          SizedBox(
            height: 10,
          ),
          TextField(

              onChanged: (value) {
                _lastname = value;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }
  Widget _builditem(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              )),
          value: selectedItem,
          items: items
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item,
                style: TextStyle(fontSize: 15)),
          ))
              .toList(),
          onChanged: (item) =>
              setState(() => selectedItem = item),
        ),
        ],
      ),
    );
  }
  Widget _buildPhoneNumber(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _phoneNumber = value;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }
  Widget _builddate(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),

          ),

          Text('${date.year}/${date.month}/${date.day}', style:TextStyle(fontSize: 17.0),),
          SizedBox(
            height: 10,
          ),
          TextField(

              onChanged: (value) {
                _date = value as Timestamp;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
          ElevatedButton(
            child:(Text('Select Date')),
            onPressed: () async{
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2022) ,
                  lastDate:DateTime(2070)
              );
              validator: (val) => val!.isEmpty ? 'Entrer une Date' : null;
              onChanged: (val) => _date = val;
              //if cancel => null
              if(newDate == null) return;
              //if ok datetime
              setState(()=> date = newDate );
              //ButtonColor : Color.fromARGB(255, 14, 12, 134);
            },
          ),
        ],
      ),
    );
  }
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Form',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xff333b49)
          ),

          children: [
            TextSpan(
              text: 'ulaire',
              style: TextStyle(color: Color(0xff384933), fontSize: 30),
            ),

          ]),
    );
  }
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  Widget _homeButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,'/home');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.home, color: Colors.black),
            ),
            Text('Home',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Positioned(
                  top: height * .85,
                  left: -MediaQuery.of(context).size.width * .3,
                  child: BezierDownContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      _buildName("Name"),
                      _buildEmail("Email"),
                      _buildlastname("Lastname"),
                      _buildPhoneNumber("PhoneNumber"),
                      _builddate("Date"),
                      _builditem("Item"),
                      SizedBox(height: 50),
                      RaisedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onPressed: () {
                          ref.add({
                            'Name': _name,
                            'email':_email,
                            'lastname':_lastname,
                            'phoneNumber': _phoneNumber,
                            'Date': _date,
                            'selectedItem':selectedItem,

                          }).whenComplete(() {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (_) => Formation_wid()));
                          });

                          //Send to API
                        },
                      )
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(top: 40, right: 0, child: _homeButton()),
            ],
          ),
        ));
  }
}