import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/modules/auth/register/register_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/inputs/input_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({super.key, this.title = 'RegisterPage'});
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterStore _store = Modular.get<RegisterStore>();
  var phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  Timer? _verificationCodeTimeout;
  final int timeout = 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();
    if (_verificationCodeTimeout != null) {
      _verificationCodeTimeout!.cancel();
    }
    super.dispose();
  }

  void _clearFields() {
    _store.setName(null);
    _store.setEmail(null);
    _store.setPassword(null);
    _store.setConfirmPassword(null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: 'Crie sua conta',
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DividerWidget(height: 2.h),
              _photoPicker(),
              _form(),
              DividerWidget(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _photoPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Observer(builder: (_) {
        return GestureDetector(
          onTap: () async {
            await _pickPhoto();
          },
          child: _photoContainer(),
        );
      }),
    );
  }

  Widget _photoContainer() {
    return Column(
      children: [
        DottedBorder(
            color: white,
            strokeWidth: 2,
            dashPattern: const [8, 8],
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                alignment: Alignment.center,
                child: _store.photoCrop != null
                    ? SizedBox(
                        height: 25.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _store.photoCrop!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    : _photoEmpty())),
      ],
    );
  }

  Widget _photoEmpty() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          color: white,
          size: 35.sp,
        ),
        textWidget('Tire uma selfie segurando um documento com foto.',
            style: label(color: white), textAlign: TextAlign.center),
      ],
    );
  }

  Future _cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioLockEnabled: true,
        )
      ],
    );
    if (croppedFile != null) {
      _store.setPhotoCrop(File(croppedFile.path));
    }
  }

  _pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxHeight: 480,
      maxWidth: 480,
    );
    if (image != null) {
      _store.setPhoto(image);

      await _cropImage(image);
    }
    setState(() {});
  }

  Widget _form() {
    return Container(
      color: primary,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Column(
        children: [
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Nome completo',
            onChanged: _store.setName,
          ),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label: 'E-mail',
              onChanged: _store.setEmail,
              keyboardType: TextInputType.emailAddress,
              error: !_store.validEmail ? "E-mail inválido" : null,
            );
          }),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Celular',
            keyboardType: TextInputType.phone,
            inputFormatters: [phoneMask],
            onChanged: (p0) {
              _store.setPhone(phoneMask.getUnmaskedText());
            },
          ),
          DividerWidget(height: 2.h),
          PasswordInputWidget(onChanged: _store.setPassword),
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            label: 'Confirmar senha',
            onChanged: _store.setPassword,
          ),
          DividerWidget(height: 5.h),
          SizedBox(
            width: 65.w,
            child: Observer(builder: (_) {
              return ButtonWidget.filled(
                title: 'Cadastre-se',
                onPressed: () async {
                  _store.setCode(null);
                  BaseModel b = await _store.register();
                  if (mounted) {
                    if (b.status) {
                      _startTimer();
                      showCustomBottomSheet(
                        context,
                        'CÓDIGO DE VERIFICAÇÃO',
                        _confirmPhoneSheet(),
                      );
                    } else {
                      showErrorBottomSheet(context, message: b.message);
                    }
                  }
                },
                loading: _store.loadingStore.isLoading,
                disabled: !_store.validForm,
                backgroundColor: accent,
                textColor: primaryDark,
              );
            }),
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    _verificationCodeTimeout =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      _store.counter--;
      _store.setCounter(_store.counter);
      if (_store.counter == 0 && _verificationCodeTimeout != null) {
        _verificationCodeTimeout!.cancel();
      }
    });
  }

  Widget _confirmPhoneSheet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DividerWidget(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: textWidget(
            'Insira o código de verificação enviado para seu celular',
            textAlign: TextAlign.center,
            style: h2(),
          ),
        ),
        DividerWidget(height: 5.h),
        VerificationCode(
          textStyle: const TextStyle(fontSize: 20.0, color: black),
          keyboardType: TextInputType.number,
          underlineColor: primary,
          length: 6,
          cursorColor: primary,
          onCompleted: _store.setCode,
          onEditing: (bool value) {},
          fullBorder: true,
        ),
        DividerWidget(height: 3.h),
        Observer(builder: (_) {
          if (_store.counter == 0) {
            return GestureDetector(
              onTap: () async {
                await _store.resendSMS();
                _startTimer();
              },
              child: textWidget(
                'Reenviar Código',
                textAlign: TextAlign.center,
                style: text(textDecoration: TextDecoration.underline),
              ),
            );
          }
          return textWidget(
            'Reenviar em: ${_store.counter} segundos',
            textAlign: TextAlign.center,
            style: text(textDecoration: TextDecoration.underline),
          );
        }),
        DividerWidget(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'CONFIRMAR',
              onPressed: () async {
                var r = await _store.validateCode();

                if (mounted) {
                  if (r.status) {
                    Timer(const Duration(seconds: 2), () {
                      Modular.to.navigate('/home/initial');
                    });
                  }
                  showBaseModalBottomSheet(
                    context,
                    r,
                    onSuccessPressed: () {
                      Modular.to.navigate('/home/initial');
                    },
                  );
                }
              },
              disabled: !_store.validCode,
              backgroundColor: accent,
              textColor: primaryDark,
            );
          }),
        )
      ],
    );
  }
}
