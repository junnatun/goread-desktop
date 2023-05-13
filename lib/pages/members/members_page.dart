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

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  //NOTE: Textfields Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jkController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  String inputEmail = '';
  String inputPassword = '';
  String inputNama = '';
  String inputJK = '';
  String inputTglLahir = '';
  String inputTelp = '';
  String inputPekerjaan = '';
  String inputAlamat = '';

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        inputEmail = emailController.value.text;
      });
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
    return Scaffold(
      body: BasicLayout(
        withButton: true,
        buttonOnTap: () {
          CustomModal.show(
            'Tambah Member',
            400.h,
            600.h,
            Column(
              children: [
                CustomTextField(
                  title: 'Email',
                  hintText: 'Email member..',
                  controller: emailController,
                ),
                CustomTextField(
                  title: 'Password',
                  hintText: 'Password member..',
                  controller: passwordController,
                  isPass: true,
                ),
                CustomTextField(
                  title: 'Nama',
                  hintText: 'Nama member..',
                  controller: namaController,
                ),
                CustomTextField(
                  title: 'Jenis Kelamin',
                  hintText: 'Jenis Kelamin member..',
                  controller: jkController,
                ),
                CustomTextField(
                  title: 'Tanggal Lahir',
                  hintText: 'Tanggal Lahir member..',
                  controller: tglLahirController,
                ),
                CustomTextField(
                  title: 'Telepon',
                  hintText: 'Telepon member..',
                  controller: telpController,
                ),
                CustomTextField(
                  title: 'Pekerjaan',
                  hintText: 'Pekerjaan member..',
                  controller: pekerjaanController,
                ),
                CustomTextField(
                  title: 'Alamat',
                  hintText: 'Alamat member..',
                  controller: alamatController,
                ),
                CustomButton(
                  title: 'Simpan',
                  onTap: () async {
                    var addUserResult =
                        await MemberServices.addUser(inputEmail, inputPassword);

                    if (addUserResult != null) {
                      var addMemberResult = await MemberServices.addMember(
                        addUserResult['id'],
                        inputNama,
                        inputJK,
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
          );
        },
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
                    label: Text('EMAIL'),
                  ),
                  DataColumn(
                    label: Text('NAMA'),
                  ),
                  DataColumn(
                    label: Text('GENDER'),
                  ),
                  DataColumn(
                    label: Text('LAHIR'),
                  ),
                  DataColumn(
                    label: Text('TELEPON'),
                  ),
                  DataColumn(
                    label: Text('PEKERJAAN'),
                  ),
                  DataColumn(
                    label: Text('ALAMAT'),
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
                        Text(data['email']),
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
                        Text(data['telp']),
                      ),
                      DataCell(
                        Text(data['pekerjaan']),
                      ),
                      DataCell(
                        Text(data['alamat']),
                      ),
                      DataCell(
                        Row(
                          children: [
                            // NOTE: Button Edit
                            Material(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  // NOTE: for default value
                                  emailController.text = data['email'];
                                  namaController.text = data['nama'];
                                  jkController.text = data['jenis_kelamin'];
                                  tglLahirController.text = data['tgl_lahir'];
                                  telpController.text = data['telp'];
                                  pekerjaanController.text = data['pekerjaan'];
                                  alamatController.text = data['alamat'];

                                  CustomModal.show(
                                    "Edit Member ${data['id_user']}",
                                    400.h,
                                    600.h,
                                    Column(
                                      children: [
                                        // CustomTextField(
                                        //   title: 'Email',
                                        //   hintText: 'Email member..',
                                        //   controller: emailController,
                                        // ),
                                        CustomTextField(
                                          title: 'Nama',
                                          hintText: 'Nama member..',
                                          controller: namaController,
                                        ),
                                        CustomTextField(
                                          title: 'Jenis Kelamin',
                                          hintText: 'Jenis Kelamin member..',
                                          controller: jkController,
                                        ),
                                        CustomTextField(
                                          title: 'Tanggal Lahir',
                                          hintText: 'Tanggal Lahir member..',
                                          controller: tglLahirController,
                                        ),
                                        CustomTextField(
                                          title: 'Telepon',
                                          hintText: 'Telepon member..',
                                          controller: telpController,
                                        ),
                                        CustomTextField(
                                          title: 'Pekerjaan',
                                          hintText: 'Pekerjaan member..',
                                          controller: pekerjaanController,
                                        ),
                                        CustomTextField(
                                          title: 'Alamat',
                                          hintText: 'Alamat member..',
                                          controller: alamatController,
                                        ),
                                        CustomButton(
                                          title: 'Simpan',
                                          onTap: () async {
                                            var editMemberResult =
                                                await MemberServices.editMember(
                                              data['id_user'],
                                              inputNama,
                                              inputJK,
                                              inputTglLahir,
                                              inputTelp,
                                              inputPekerjaan,
                                              inputAlamat,
                                            );
                                            setState(() {
                                              Get.toNamed('/dashboardPage');
                                              Get.toNamed('/membersPage');
                                              CustomSnackbar.show('Yeay',
                                                  editMemberResult?['message']);
                                            });
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
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(5.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.r),
                                splashColor: pinkColor,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  CustomModal.show(
                                    'Warning!',
                                    400.h,
                                    250.h,
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
                                                    'Yeay',
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
              color: purpleColor,
            ));
          },
        ),
      ),
    );
  }
}
