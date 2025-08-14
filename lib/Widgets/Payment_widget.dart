// import 'package:flutter/cupertino.dart';
// final Color primaryColor = const Color(0xFF1E0D4D);
// class Heder_widge extends StatefulWidget {
//   const Heder_widge({super.key});
//
//   @override
//   State<Heder_widge> createState() => _Heder_widgeState();
// }
//
// class _Heder_widgeState extends State<Heder_widge> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _stepIcon(Icons.location_on_outlined, "Address", false),
// _stepIcon(Icons.qr_code, "Order Summary", true),
// _stepIcon(Icons.payment_outlined, "Payment", false),
// ],
// ),
//
// Widget _stepIcon(IconData icon, String label, bool isSelected) {
//   return Column(
//     children: [
//       Icon(icon,
//           size: 20, color: isSelected ? primaryColor : Colors.black38),
//       const SizedBox(height: 4),
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: isSelected ? primaryColor : Colors.black45),
//       ),
//       if (isSelected)
//         Container(
//           margin: const EdgeInsets.only(top: 6),
//           height: 2,
//           width: 50,
//           color: primaryColor,
//         ),
//     ],
//   );
// }
