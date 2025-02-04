

class Intervention {

  final String name; 
  final String vechicleID; 
  final String deviceID; 
  final String company;
  final String technician; 
  final String type; 
  final String date;

  Intervention({required this.name, required this.vechicleID, required this.deviceID, required this.company, required this.technician, required this.type, this.date = "31/01/2025"});

  
}


final fakeInterventions = <Intervention>[

  Intervention(
    name: "IQ-W0001-0002",
    vechicleID: "VRN 0001",
    deviceID: "D 9001",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0002-0003",
    vechicleID: "VRN 0002",
    deviceID: "D 9034",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0003-0004",
    vechicleID: "VRN 0321",
    deviceID: "D 9413",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Maintenance"
  ),

  Intervention(
    name: "IQ-W0004-0005",
    vechicleID: "VRN 2654",
    deviceID: "D 9634",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0005-0006",
    vechicleID: "VRN 523423",
    deviceID: "D 5141",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Maintenance"
  ),

  Intervention(
    name: "IQ-W0001-0002",
    vechicleID: "VRN 0001",
    deviceID: "D 9001",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0002-0003",
    vechicleID: "VRN 0002",
    deviceID: "D 9034",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0003-0004",
    vechicleID: "VRN 0321",
    deviceID: "D 9413",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Maintenance"
  ),

  Intervention(
    name: "IQ-W0004-0005",
    vechicleID: "VRN 2654",
    deviceID: "D 9634",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Repair"
  ),

  Intervention(
    name: "IQ-W0005-0006",
    vechicleID: "VRN 523423",
    deviceID: "D 5141",
    company: "Taxitroni SAU",
    technician: "Flopez", 
    type: "Maintenance"
  ),

];