import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:initium/User/ui/widgets/profile_trips.dart';
import '../../bloc/bloc_user.dart';

class AccountUserScreen extends StatefulWidget {
  @override
  _AccountUserScreenState createState() => _AccountUserScreenState();
}

class _AccountUserScreenState extends State<AccountUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: BlocProvider<UserBloc>(
        bloc: UserBloc(),
        child: ProfileTrips(),
      ),
    );
  }
}
