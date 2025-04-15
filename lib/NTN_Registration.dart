import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class NTNRegistrationPage extends StatefulWidget {
  @override
  _NTNRegistrationPageState createState() => _NTNRegistrationPageState();
}

class _NTNRegistrationPageState extends State<NTNRegistrationPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  Future<bool> _requestPermissions(ImageSource source) async {
    PermissionStatus status;
    if (source == ImageSource.gallery) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.camera.request();
    }

    if (status.isGranted) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '${source == ImageSource.gallery ? 'Storage' : 'Camera'} permission is required.')),
      );
      return false;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    if (await _requestPermissions(source)) {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null && File(pickedFile.path).existsSync()) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  Future<void> _uploadImageAndData() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload a CNIC image.')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      // 1. Upload the image to Firebase Storage
      firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('cnic_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(_image!);
      String imageUrl = await storageRef.getDownloadURL();

      // 2. Store the image URL and other data in Firestore
      CollectionReference ntnRegistrations = FirebaseFirestore.instance.collection('ntn_registrations');

      await ntnRegistrations.add({
        'cnicImageUrl': imageUrl,
        'uploadTimestamp': FieldValue.serverTimestamp(),
        // Add other relevant user data here if needed (e.g., user ID)
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CNIC image uploaded successfully!')),
      );

      setState(() {
        _image = null; // Clear the image after successful upload
        _isUploading = false;
      });

      // Optionally navigate to a success page
      // Navigator.pushReplacementNamed(context, '/registration_success');

    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload CNIC image. Please try again.')),
      );
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100.0,
                color: Colors.yellow,
              ),
              Icon(
                Icons.check_circle,
                size: 30.0,
                color: Colors.yellow,
              ),
              SizedBox(height: 20.0),
              Text(
                'NTN Registration',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'The below cited document is for NTN Registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Upload CNIC'),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Capture from Camera'),
              ),
              SizedBox(height: 20.0),
              Text(
                'i. Upload your CNIC back and front',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'ii. The image must be clear',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30.0),
              _image != null
                  ? Column(
                children: [
                  Text(
                    'Selected Image:',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Image.file(
                    _image!,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.0),
                ],
              )
                  : Container(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 18.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: _isUploading ? null : _uploadImageAndData,
                child: _isUploading
                    ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
                    : Text('Continue', style: TextStyle(fontSize: 18.0)),
              ),
            ],
          ),
        ),
      ),


    );
  }
}