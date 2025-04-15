import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class GSTRegistrationScreen extends StatefulWidget {
  @override
  _GSTRegistrationScreenState createState() => _GSTRegistrationScreenState();
}

class _GSTRegistrationScreenState extends State<GSTRegistrationScreen> {
  TextEditingController _businessNameController = TextEditingController();
  String? _selectedBusinessType;
  DateTime? _startDate;
  String? _selectedBusinessNature;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _consumerNumberController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
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
                  Icon(Icons.folder_open, size: 40.0, color: Colors.black),
                  SizedBox(height: 10.0),
                  Text(
                    'GST Registration',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Please Provide The Below Information Which Is Required To Register Your Sales Tax Business',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            TextFormField(
              controller: _businessNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Enter Business Name',
                labelStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                // Show business type dropdown/modal
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomSheet(
                      title: 'Select Business Type',
                      options: ['Sole Proprietorship', 'Partnership', 'Company', 'Other'],
                      onItemSelected: (value) {
                        setState(() {
                          _selectedBusinessType = value;
                        });
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _selectedBusinessType ?? 'Select Business Type',
                      style: TextStyle(
                        color: _selectedBusinessType == null ? Colors.grey[800] : Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _startDate == null ? 'Start Date' : DateFormat('yyyy-MM-dd').format(_startDate!),
                  style: TextStyle(color: _startDate == null ? Colors.grey[600] : Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                // Show business nature dropdown/modal
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomSheet(
                      title: 'Select Business Nature',
                      options: ['Manufacturing', 'Trading', 'Services', 'Other'],
                      onItemSelected: (value) {
                        setState(() {
                          _selectedBusinessNature = value;
                        });
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _selectedBusinessNature ?? 'Select Business Nature',
                      style: TextStyle(
                        color: _selectedBusinessNature == null ? Colors.grey[800] : Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _consumerNumberController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Consumer Number (GAS/Electricity)',
                labelStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle continue button action
                      print('Continue pressed');
                      // You would likely collect the form data here
                      print('Business Name: ${_businessNameController.text}');
                      print('Business Type: $_selectedBusinessType');
                      print('Start Date: $_startDate');
                      print('Business Nature: $_selectedBusinessNature');
                      print('Description: ${_descriptionController.text}');
                      print('Consumer Number: ${_consumerNumberController.text}');
                      // And then proceed with the registration logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet({
    required String title,
    required List<String> options,
    required Function(String) onItemSelected,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Divider(color: Colors.grey[600]),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final option = options[index];
              return ListTile(
                title: Text(option, style: TextStyle(color: Colors.white)),
                onTap: () {
                  onItemSelected(option);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}