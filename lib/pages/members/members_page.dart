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

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  //NOTE: Textfields Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jkController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

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
    passwordController.addListener(() {
      inputPassword = passwordController.value.text;
    });

    namaController.addListener(() {
      inputNama = namaController.value.text;
    });
    jkController.addListener(() {
      inputJK = jkController.value.text;
    });
    tglLahirController.addListener(() {
      inputTglLahir = tglLahirController.value.text;
    });
    telpController.addListener(() {
      inputTelp = telpController.value.text;
    });
    pekerjaanController.addListener(() {
      inputPekerjaan = pekerjaanController.value.text;
    });
    alamatController.addListener(() {
      inputAlamat = alamatController.value.text;
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
                          CustomTextField(
                            title: 'Nama',
                            hintText: 'Nama member..',
                            controller: namaController,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jenis Kelamin',
                                style: heading3MediumTextStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 70.0,
                                child: Obx(
                                  () => RadioGroup<String>.builder(
                                    direction: Axis.horizontal,
                                    fillColor: const Color(0xff312A4F),
                                    activeColor: const Color(0xff312A4F),
                                    groupValue:
                                        genderController.selectedItem.value,
                                    horizontalAlignment:
                                        MainAxisAlignment.spaceAround,
                                    onChanged: (value) => setState(() {
                                      genderController.selectedItem.value =
                                          value ?? '';
                                    }),
                                    items: _gender,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: const Color(0xff312A4F),
                                    ),
                                    itemBuilder: (item) => RadioButtonBuilder(
                                      item,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          CustomTextField(
                            title: 'Telepon',
                            hintText: 'Telepon member..',
                            controller: telpController,
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 325.h,
                      child: Column(
                        children: [
                          CustomTextField(
                            title: 'Password',
                            hintText: 'Password member..',
                            controller: passwordController,
                            isPass: true,
                          ),
                          CustomTextField(
                            title: 'Pekerjaan',
                            hintText: 'Pekerjaan member..',
                            controller: pekerjaanController,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tanggal Lahir",
                                style: heading3MediumTextStyle,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextfieldDatePicker(
                                  cupertinoDatePickerBackgroundColor:
                                      Colors.white,
                                  cupertinoDatePickerMaximumDate:
                                      DateTime(2024),
                                  cupertinoDatePickerMaximumYear:
                                      DateTime.now().year,
                                  cupertinoDatePickerMinimumYear: 1980,
                                  cupertinoDatePickerMinimumDate:
                                      DateTime(1990),
                                  cupertinoDateInitialDateTime: DateTime.now(),
                                  materialDatePickerFirstDate: DateTime(1980),
                                  materialDatePickerInitialDate: DateTime.now(),
                                  materialDatePickerLastDate: DateTime(2024),
                                  preferredDateFormat: DateFormat('yyyy-MM-dd'),
                                  textfieldDatePickerController:
                                      tglLahirController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        heading4RegulerTextStyle.copyWith(
                                      color: purpleDarkColor.withOpacity(0.8),
                                    ),
                                    hintText: 'Pilih tanggal..',
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff312A4F),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                          CustomTextField(
                            title: 'Alamat',
                            hintText: 'Alamat member..',
                            controller: alamatController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomButton(
                            title: 'Simpan',
                            onTap: () async {
                              var addUserResult = await MemberServices.addUser(
                                  inputUsername, inputPassword);

                              if (addUserResult != null) {
                                var addMemberResult =
                                    await MemberServices.addMember(
                                  addUserResult['id'],
                                  inputNama,
                                  genderController.selectedItem.value,
                                  inputTglLahir,
                                  inputTelp,
                                  inputPekerjaan,
                                  inputAlamat,
                                );
                                setState(() {
                                  Get.toNamed('/dashboardPage');
                                  Get.toNamed('/membersPage');
                                  CustomSnackbar.show(
                                      'Yeay', addMemberResult?['message']);
                                });
                              }
                            },
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
                  DataColumn(
                    label: Text('USERNAME'),
                  ),
                  DataColumn(
                    label: Text('NAMA'),
                  ),
                  DataColumn(
                    label: Text('GENDER'),
                  ),
                  DataColumn(
                    label: Text('TGL LAHIR'),
                  ),
                  DataColumn(
                    label: Text('PEKERJAAN'),
                  ),
                  DataColumn(
                    label: Text('ALAMAT'),
                  ),
                  DataColumn(
                    label: Text('TELEPON'),
                  ),
                  DataColumn(
                    label: Text('ACTION'),
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
                      DataCell(
                        Text(data['username']),
                      ),
                      DataCell(
                        Text(data['nama']),
                      ),
                      DataCell(
                        Text(data['jenis_kelamin']),
                      ),
                      DataCell(
                        Text(data['tgl_lahir']),
                      ),
                      DataCell(
                        Text(data['profesi']),
                      ),
                      DataCell(
                        Text(data['alamat']),
                      ),
                      DataCell(
                        Text(data['telp']),
                      ),
                      DataCell(
                        Row(
                          children: [
                            // NOTE: Button Edit
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  // NOTE: for default value
                                  usernameController.text = data['username'];
                                  namaController.text = data['nama'];
                                  jkController.text = data['jenis_kelamin'];
                                  tglLahirController.text = data['tgl_lahir'];
                                  telpController.text = data['telp'];
                                  pekerjaanController.text = data['profesi'];
                                  alamatController.text = data['alamat'];

                                  genderController.selectedItem.value =
                                      data['jenis_kelamin'];

                                  CustomModal.show(
                                    "Edit Member ${data['id_user']}",
                                    800.h,
                                    460.h,
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 325.h,
                                              child: Column(
                                                children: [
                                                  CustomTextField(
                                                    title: 'Nama',
                                                    hintText: 'Nama member..',
                                                    controller: namaController,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Jenis Kelamin',
                                                        style:
                                                            heading3MediumTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      SizedBox(
                                                        height: 70.0,
                                                        child: Obx(
                                                          () => RadioGroup<
                                                              String>.builder(
                                                            direction:
                                                                Axis.horizontal,
                                                            fillColor:
                                                                const Color(
                                                                    0xff312A4F),
                                                            activeColor:
                                                                const Color(
                                                                    0xff312A4F),
                                                            groupValue:
                                                                genderController
                                                                    .selectedItem
                                                                    .value,
                                                            horizontalAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              genderController
                                                                      .selectedItem
                                                                      .value =
                                                                  value ?? '';
                                                            }),
                                                            items: _gender,
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 20,
                                                              color: const Color(
                                                                  0xff312A4F),
                                                            ),
                                                            itemBuilder: (item) =>
                                                                RadioButtonBuilder(
                                                              item,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  CustomTextField(
                                                    title: 'Telepon',
                                                    hintText:
                                                        'Telepon member..',
                                                    controller: telpController,
                                                  ),
                                                  SizedBox(
                                                    height: 60.h,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 325.h,
                                              child: Column(
                                                children: [
                                                  CustomTextField(
                                                    title: 'Pekerjaan',
                                                    hintText:
                                                        'Pekerjaan member..',
                                                    controller:
                                                        pekerjaanController,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tanggal Lahir",
                                                        style:
                                                            heading3MediumTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 40.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                        ),
                                                        child:
                                                            TextfieldDatePicker(
                                                          cupertinoDatePickerBackgroundColor:
                                                              Colors.white,
                                                          cupertinoDatePickerMaximumDate:
                                                              DateTime(2024),
                                                          cupertinoDatePickerMaximumYear:
                                                              DateTime.now()
                                                                  .year,
                                                          cupertinoDatePickerMinimumYear:
                                                              1980,
                                                          cupertinoDatePickerMinimumDate:
                                                              DateTime(1990),
                                                          cupertinoDateInitialDateTime:
                                                              DateTime.now(),
                                                          materialDatePickerFirstDate:
                                                              DateTime(1980),
                                                          materialDatePickerInitialDate:
                                                              DateTime.now(),
                                                          materialDatePickerLastDate:
                                                              DateTime(2024),
                                                          preferredDateFormat:
                                                              DateFormat(
                                                                  'yyyy-MM-dd'),
                                                          textfieldDatePickerController:
                                                              tglLahirController,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintStyle:
                                                                heading4RegulerTextStyle
                                                                    .copyWith(
                                                              color: purpleDarkColor
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                            hintText:
                                                                'Pilih tanggal..',
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff312A4F),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  ),
                                                  CustomTextField(
                                                    title: 'Alamat',
                                                    hintText: 'Alamat member..',
                                                    controller:
                                                        alamatController,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CustomButton(
                                                    title: 'Simpan Perubahan',
                                                    onTap: () async {
                                                      var editMemberResult =
                                                          await MemberServices
                                                              .editMember(
                                                        data['id_user'],
                                                        inputNama,
                                                        genderController
                                                            .selectedItem.value,
                                                        inputTglLahir,
                                                        inputTelp,
                                                        inputPekerjaan,
                                                        inputAlamat,
                                                      );
                                                      setState(() {
                                                        Get.toNamed(
                                                            '/dashboardPage');
                                                        Get.toNamed(
                                                            '/membersPage');
                                                        CustomSnackbar.show(
                                                            'Yeay',
                                                            editMemberResult?[
                                                                'message']);
                                                      });
                                                    },
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
                                child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/icon_edit.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            // NOTE: button delete
                            Material(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                    'Warning!', //NOTE: title
                                    400.h, //NOTE: width
                                    250.h, //NOTE: height

                                    //NOTE: child
                                    Column(
                                      children: [
                                        Text(
                                            "Yakin mau hapus Member ${data['id_user']}??"),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        CustomButton(
                                          title: 'Hapus',
                                          onTap: () async {
                                            var deleteMemberResult =
                                                await MemberServices
                                                    .deleteMember(
                                                        data['id_user']);

                                            if (deleteMemberResult != null) {
                                              setState(() {
                                                Get.toNamed('/dashboardPage');
                                                Get.toNamed('/membersPage');
                                                CustomSnackbar.show(
                                                    'Yeay', //NOTE: title

                                                    //NOTE: message
                                                    deleteMemberResult[
                                                        'message']);
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/icon_delete.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
