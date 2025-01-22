class DeliveryPersonModal {
  String? Name;
  String? UserName;
  String? Email;
  String? MobileNo;
  String? Password;
  String? VehicleType;
  String? Licence;
  String? PlateNo;
  String? VehicleModel;
  String? BankAccountNumber;
  String? IFSC;
  String? UPI;
  String? EmergencyContactName;
  String? Relationship; // optional field
  String? EmergencyContactNo;

  // Constructor
  DeliveryPersonModal({
    required this.Name,
    required this.UserName,
    required this.Email,
    required this.MobileNo,
    required this.Password,
    required this.VehicleType,
    required this.Licence,
    required this.PlateNo,
    required this.VehicleModel,
    required this.BankAccountNumber,
    required this.IFSC,
    required this.UPI,
    required this.EmergencyContactName,
    this.Relationship = '',
    this.EmergencyContactNo = '',
  });
}
