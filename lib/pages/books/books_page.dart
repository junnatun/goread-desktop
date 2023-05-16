import 'package:carent_app/controllers/member_contoller.dart';
import 'package:carent_app/services/member_services.dart';
import 'package:carent_app/themes/themes.dart';
import 'package:carent_app/widgets/basic_layout.dart';
import 'package:carent_app/widgets/custom_button.dart';
import 'package:carent_app/widgets/custom_modal.dart';
import 'package:carent_app/widgets/custom_snackbar.dart';
import 'package:carent_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  //NOTE: Textfields Controllers
  final TextEditingController usernameController = TextEditingController();

  String inputUsername = '';
  String inputPassword = '';
  String inputNama = '';
  String inputJK = '';
  String inputTglLahir = '';
  String inputTelp = '';
  String inputPekerjaan = '';
  String inputAlamat = '';

  final _gender = ["L", "P"];

  @override
  void initState() {
    usernameController.addListener(() {
      inputUsername = usernameController.value.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MemberController genderController = Get.put(MemberController());
    return Scaffold(
      body: BasicLayout(
        withButton: true,
        buttonOnTap: () {
          //NOTE: Untuk menambah data <button pojok kanan bawah>
          CustomModal.show(
            'Tambah Member', //title
            800.h, //width
            550.h, //height
            //child
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 325.h,
                      child: Column(
                        children: [
                          CustomTextField(
                            title: 'Username',
                            hintText: 'Username member..',
                            controller: usernameController,
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        // NOTE: untuk menampilkan data ke tabel
        child: FutureBuilder<List<dynamic>?>(
          future: MemberServices.getMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                dataTextStyle: heading4RegulerTextStyle.copyWith(fontSize: 14),
                headingTextStyle: heading4BoldTextStyle.copyWith(fontSize: 14),
                dataRowHeight: 100.h,
                columns: const [
                  DataColumn2(
                    label: Text('ID'),
                  ),
                ],
                rows: List.generate(
                  snapshot.data!.length,
                  (index) {
                    var data = snapshot.data![index];
                    return DataRow(cells: [
                      DataCell(
                        Text(data['id_user']),
                      ),
                    ]);
                  },
                ).toList(),
                showBottomBorder: true,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // By default show a loading spinner.
            return Center(
                child: CircularProgressIndicator(
              color: orangeColor,
            ));
          },
        ),
      ),
    );
  }
}
