import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:localauth_example/screens/homescreen.dart';

class LocalAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  // Check if the device supports biometrics
  Future<bool> isBiometricAvailable() async {
    try {
      return await _localAuth.canCheckBiometrics ||
          await _localAuth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  // Authenticate using biometrics or device credentials
  Future<bool> authenticate() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        // biometricOnly: false,
        // useErrorDialogs: true,
        // stickyAuth: true,
      );
    } catch (e) {
      return false;
    }
  }
}

class LocalAuthScreen extends StatefulWidget {
  @override
  _LocalAuthScreenState createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final LocalAuthService _authService = LocalAuthService();
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = await _authService.authenticate();
    setState(() {
      _isAuthenticated = isAuthenticated;
    });

    if (isAuthenticated) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isAuthenticated
            ? Text('Authenticated!')
            : ElevatedButton(
                onPressed: _authenticateUser,
                child: Text('Authenticate'),
              ),
      ),
    );
  }
}
