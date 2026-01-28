import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final MobileScannerController cameraController = MobileScannerController();

  bool scanned=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Favorite'),
//   actions: [
//     IconButton(
//       icon: const Icon(Icons.flash_on),
//       onPressed: () {
//         cameraController.stop();
//       },
//     ),
//   ],
// ),

//       body: Column(
//         children: [
//           SizedBox(
//             height: height * 0.5,
//             child: MobileScanner(
//                 controller: cameraController,
//                 onDetect: (capture) {
//                   if (scanned) return;
            
//                   final List<Barcode> barcodes = capture.barcodes;
//                   if (barcodes.isNotEmpty) {
//                     final String? code = barcodes.first.rawValue;
//                     if (code != null) {
//                       scanned = true;
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Scanned: $code')),  
//                       );
//                       print('QR Code!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!: $code');
//                     }
//                   }
//                 },
//               ),
//           ),
//           SizedBox(height: 5,),
//           Text('Scan a QR code to see the result here.'),
//           SizedBox(height: 5,),
          
//         ],
  ),
  body: Center(child: Text("favorite"),),
    );
  }
}