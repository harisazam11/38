import 'package:edonation/viewModel/admin/adminViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/di/injection_container.dart';
import '../../res/components/bottomNavigations/bottomNavigationAdmin.dart';

class adminDashboard extends StatelessWidget {
  const adminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ChangeNotifierProvider.value(
        value: getIt<AdminViewModel>(),
        child: Builder(
          builder: (context) {

            return Consumer<AdminViewModel>(
              builder: (context, pr, _) {
                return Scaffold(
                  bottomNavigationBar: BottomNavigationAdmin(currentIndex: pr.currentIndex, onTap: ( value ) {
                    pr.setIndex(value);
                  }),
                  body: SafeArea(
                    child: pr.screens[pr.currentIndex],
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/customDialogs.dart';
import '../utils/appColors.dart';

class adminProfile extends StatelessWidget {
  const adminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Admin", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: h*0.008,),
          Text("Admin Access", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: h*0.008,),
          // Container(
          // color: Colors.white,
          // child: ListTile(
          // title: Text("Contact Number", style: Theme.of(context).textTheme.bodyLarge),
          // subtitle: Text("03114062481", style: Theme.of(context).textTheme.bodyLarge),
          // trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit, document.color:
          appColors.defaultColor)),
          // ),
          // ),
          // ).
          SizedBox(height: h*0.008,),
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                customDialogs.logoutDialog(context);
              },
              leading: const Icon(Icons.logout, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}

title: Text("Logout", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red)),
      ),
    );
  }
  const Spacer(),
  Align(alignment: Alignment.center, child: Text("Version 1.0", style:
Theme.of(context).textTheme.titleMedium?.copyWith(color: appColors.defaultColor),)),
  SizedBox(height: h*0.003,),
  Align(alignment: Alignment.center, child: Text("BUITEMS, Org.", style:
Theme.of(context).textTheme.titleMedium),),