import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alquranMobile/utils/Colors.dart';
import 'package:alquranMobile/utils/FontsFamily.dart';
import 'package:alquranMobile/components/Appbar.dart';
import 'package:alquranMobile/constants/Dictionary.dart';
import 'package:alquranMobile/constants/Navigation.dart';
import 'package:alquranMobile/models/QuranListModel.dart';
import 'package:alquranMobile/models/PopupMenuModel.dart';
import 'package:alquranMobile/blocs/quranlist/cubit/quranlist_cubit.dart';

class QuranListPage extends StatefulWidget {
  @override
  _QuranListPageState createState() => _QuranListPageState();
}

class _QuranListPageState extends State<QuranListPage> {

  @override
  void initState() {
    context.bloc<QuranlistCubit>().getQuranList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.white,
      appBar: buildAppBar(),
      body: BlocConsumer<QuranlistCubit, QuranlistState>(
        listener: (context, state) {
          if (state is ErrorState) {
            Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('error bro'),
                ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () => context.bloc<QuranlistCubit>().getQuranList(),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: 1, 
                ),
                itemCount: state.quranList.length,
                itemBuilder: (context, index) {
                  final quranList = state.quranList[index];
                  return buildListTile(quranList);
                }
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildAppBar() {
    return CustomAppBar(
      title: Dictionary.appName,
      actions: [
        PopupMenuButton(
          offset: Offset(0,10),
          icon: Icon(Icons.more_vert, color: ColorBase.black),
          tooltip: 'More options',
          elevation: 5,
          onSelected: _navigate,
          itemBuilder: (context) => actionList.map((menu) => PopupMenuItem(
            child: Text(menu.title),
            value: menu.page,
            ),
          ).toList(),
        )
      ],
    );
  }

  Widget buildListTile(QuranListModel quranList) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(color: ColorBase.separator, width: 2.0),
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(
          quranList.id.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: ColorBase.grey
          ),
        )),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            quranList.suratName,
            style: TextStyle(
              fontWeight: FontWeight.w500
            )
          ),
          Text(
            ' ( ${quranList.suratText} ) ', 
            style: TextStyle(
              fontFamily: FontsFamily.lpmq
              )
            ) 
        ]
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.0,),
          Text(
            '${Dictionary.translate}: ${quranList.suratTerjemahan}',
            style: TextStyle(
              fontSize: 13.0
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            '${Dictionary.ayatCount}: ${quranList.countAyat}',
            style: TextStyle(
              fontSize: 13.0
            ),
          )
        ],
      ),
      // isThreeLine: true,
      trailing: Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(context, Navigation.QuranDetail, arguments: quranList )
    );
  }

  void _navigate(String page) {
    if (page != null) {
      Navigator.pushNamed(context, page);
    }
    return null;
  }
}