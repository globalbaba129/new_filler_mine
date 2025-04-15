import 'package:flutter/material.dart';

class ATLStatusInquiryScreen extends StatefulWidget {
  @override
  _ATLStatusInquiryScreenState createState() => _ATLStatusInquiryScreenState();
}

class _ATLStatusInquiryScreenState extends State<ATLStatusInquiryScreen> {
  TextEditingController _cnicController = TextEditingController();
  String _atlStatus = '';
  bool _isLoading = false;

  // Simulate ATL status inquiry function
  Future<void> _checkATLStatus(String cnic) async {
    setState(() {
      _isLoading = true;
      _atlStatus = '';
    });

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual ATL status API call
    if (cnic == '1234567890123') {
      setState(() {
        _atlStatus = 'Your CNIC is on the Active Taxpayer List (ATL).';
        _isLoading = false;
      });
    } else if (cnic.isEmpty) {
      setState(() {
        _atlStatus = 'Please enter your CNIC Number.';
        _isLoading = false;
      });
    } else {
      setState(() {
        _atlStatus = 'Your CNIC is not currently on the Active Taxpayer List (ATL).';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.yellow),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 30.0,
                    child: Icon(Icons.format_list_bulleted, size: 40.0, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Active Taxpayer List (ATL)',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Active Taxpayer List (ATL) Name Finder, Validate Whether You Are Active Tax Filer Or Not',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'CNIC Number',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _cnicController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your CNIC Number',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isLoading ? null : () {
                _checkATLStatus(_cnicController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: _isLoading
                  ? SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[800]!),
                ),
              )
                  : Text(
                'Search',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            if (_atlStatus.isNotEmpty)
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _atlStatus,
                  style: TextStyle(
                    color: Colors.yellow[400],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}