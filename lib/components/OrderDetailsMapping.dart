// import 'package:tsf/utils/responses/SingleOrderDetailsResponse.dart';

// class OrderDetailsMapping {
//   final Map<String, String> orderDetails = {
//     'Customer Name': 'CustomerName',
//     'Destination': 'destination',
//     'Customer PO No': 'customerPoNo',
//     'So Number': 'soNumber',
//     'So Date': 'soDate',
//     'Film Type': 'filmType',
//     'core Id Mm': 'coreIdMm',
//     'Roll outer Dia (mm)': 'length',
//     'Width (MM)': 'widthMm',
//     'Order Quantity (kg)': 'soQuantity',
//     'Dispatched Quantity (Kg)': 'despQty',
//     'Total Ready Stock/Finished Goods Quantity (kg)': 'pendToDespatchQty',
//     'Pending for Production (kg)': 'toProduceSoQty',
//     'Request Date': 'requestDate',
//     'Promise Date': 'promiseDateM',
//   };
//   Map<String, dynamic> convertApiResponseToDisplayFormat(
//       SingleOrderDetails details) {
//     final Map<String, dynamic> userFriendlyDetails = {};

//     // Using reflection (mirrors) might be tempting here to automate the process,
//     // but it's not recommended for Flutter due to tree shaking considerations
//     // and potential performance overhead.

//     // Instead, we can manually map the properties
//     final properties = details.singleOrderDetails.toJson();

//     orderDetails.forEach((userFriendlyKey, jsonKey) {
//       // Check if the jsonKey exists in the properties map
//       if (properties.containsKey(jsonKey)) {
//         // Use the user-friendly key for the new map
//         userFriendlyDetails[userFriendlyKey] = properties[jsonKey];
//       }
//     });

//     return userFriendlyDetails;
//   }
// }
