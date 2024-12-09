import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String? qrRawValue;
  Color qrColor = Colors.white;
  final List<String> qrTypes = ['JPG', 'PNG', 'SVG', 'PDF'];
  String? selectedQrType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create QR Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 23, 169),
        elevation: 4,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 77, 23, 169),
                      Colors.purple.shade800,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Screenshot(
                          controller: screenshotController,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: qrRawValue == null
                                ? null
                                : BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.1),
                                        width: 2),
                                  ),
                            child: qrRawValue == null
                                ? const Text(
                                    "No QR Code Generated",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: qrColor,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 15,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: PrettyQr(
                                      data: qrRawValue!,
                                      size: 180,
                                      roundEdges: true,
                                      elementColor: Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Insert Link",
                            hintText: "Enter URL or Text",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurple),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              qrRawValue = value;
                            });
                          },
                        ),
                        const SizedBox(height: 25),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedQrType,
                            hint: const Text('Select QR Code Type'),
                            isExpanded: true,
                            items: qrTypes.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedQrType = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var color in [
                              Colors.grey,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.cyan,
                              Colors.purple
                            ])
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    qrColor = color;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: qrColor == color
                                          ? Colors.white
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    qrRawValue = null;
                                    selectedQrType = null;
                                  });
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.grey.shade200,
                              height: 50,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  _shareQrCode();
                                },
                                child: const Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _shareQrCode() async {
    // Capture screenshot of the QR
    final image = await screenshotController.capture();
    if (image != null) {
      // If capture is successful, share the QR code image
      await Share.shareXFiles([
        XFile.fromData(
          image,
          name: "qr_code.png",
          mimeType: "image/png",
        ),
      ]);
    }
  }
}
