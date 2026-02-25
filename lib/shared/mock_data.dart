import 'package:doctorpoint/features/appointments/domain/entities/appointment.dart';
import 'package:doctorpoint/features/consultations/domain/entities/consultation.dart';
import 'package:doctorpoint/features/doctors/domain/entities/doctor.dart';
import 'package:doctorpoint/features/patients/domain/entities/patient.dart';
import 'package:doctorpoint/features/stock/domain/entities/medical_item.dart';

final mockPatients = <Patient>[
  Patient(id: 'p1', firstName: 'Aminata', lastName: 'Sow', birthDate: DateTime(1988, 4, 11), gender: 'F', phone: '+221770001001', email: 'aminata@doctorpoint.sn', address: 'Dakar', bloodType: 'O+', allergies: const ['Pénicilline'], chronicDiseases: const ['Hypertension'], insuranceId: 'INS-0001', isActive: true),
  Patient(id: 'p2', firstName: 'Cheikh', lastName: 'Ndiaye', birthDate: DateTime(1979, 8, 1), gender: 'M', phone: '+221770001002', email: 'cheikh@doctorpoint.sn', address: 'Thiès', bloodType: 'A+', allergies: const [], chronicDiseases: const ['Diabète'], insuranceId: 'INS-0002', isActive: true),
  Patient(id: 'p3', firstName: 'Fatou', lastName: 'Ba', birthDate: DateTime(1995, 3, 4), gender: 'F', phone: '+221770001003', email: 'fatou.ba@doctorpoint.sn', address: 'Mbour', bloodType: 'B+', allergies: const ['Arachides'], chronicDiseases: const [], insuranceId: 'INS-0003', isActive: false),
  Patient(id: 'p4', firstName: 'Mamadou', lastName: 'Diallo', birthDate: DateTime(1969, 10, 10), gender: 'M', phone: '+221770001004', email: 'mamadou@doctorpoint.sn', address: 'Saint-Louis', bloodType: 'AB+', allergies: const [], chronicDiseases: const ['Asthme'], insuranceId: 'INS-0004', isActive: true),
  Patient(id: 'p5', firstName: 'Khady', lastName: 'Diouf', birthDate: DateTime(2000, 2, 13), gender: 'F', phone: '+221770001005', email: 'khady@doctorpoint.sn', address: 'Kaolack', bloodType: 'O-', allergies: const [], chronicDiseases: const [], insuranceId: 'INS-0005', isActive: true),
];

final mockDoctors = <Doctor>[
  Doctor(id: 'd1', name: 'Dr. Fatou Ndiaye', speciality: 'Cardiologie', email: 'fatou.ndiaye@doctorpoint.sn', licenseNumber: 'SN-CAR-001', phone: '+221770010001', rating: 4.9, yearsExperience: 12, patientCount: 320, isAvailable: true, availableDays: const ['Lun', 'Mer']),
  Doctor(id: 'd2', name: 'Dr. Moussa Diop', speciality: 'Neurologie', email: 'moussa.diop@doctorpoint.sn', licenseNumber: 'SN-NEU-002', phone: '+221770010002', rating: 4.8, yearsExperience: 9, patientCount: 270, isAvailable: true, availableDays: const ['Mar', 'Jeu']),
  Doctor(id: 'd3', name: 'Dr. Astou Seck', speciality: 'Pédiatrie', email: 'astou.seck@doctorpoint.sn', licenseNumber: 'SN-PED-003', phone: '+221770010003', rating: 4.7, yearsExperience: 8, patientCount: 230, isAvailable: false, availableDays: const ['Ven']),
  Doctor(id: 'd4', name: 'Dr. Omar Fall', speciality: 'Gynécologie', email: 'omar.fall@doctorpoint.sn', licenseNumber: 'SN-GYN-004', phone: '+221770010004', rating: 4.6, yearsExperience: 7, patientCount: 180, isAvailable: true, availableDays: const ['Lun', 'Ven']),
  Doctor(id: 'd5', name: 'Dr. Aïcha Kane', speciality: 'Dermatologie', email: 'aicha.kane@doctorpoint.sn', licenseNumber: 'SN-DER-005', phone: '+221770010005', rating: 4.8, yearsExperience: 10, patientCount: 250, isAvailable: true, availableDays: const ['Mar', 'Sam']),
];

final mockAppointments = <Appointment>[
  Appointment(id: 'a1', patientId: 'p1', patientName: 'Aminata Sow', doctorId: 'd1', doctorName: 'Dr. Fatou Ndiaye', speciality: 'Cardiologie', dateTime: DateTime.now().add(const Duration(hours: 3)), status: AppointmentStatus.confirmed, notes: '', reason: 'Contrôle tension'),
  Appointment(id: 'a2', patientId: 'p2', patientName: 'Cheikh Ndiaye', doctorId: 'd2', doctorName: 'Dr. Moussa Diop', speciality: 'Neurologie', dateTime: DateTime.now().add(const Duration(days: 1)), status: AppointmentStatus.pending, notes: '', reason: 'Migraine'),
  Appointment(id: 'a3', patientId: 'p3', patientName: 'Fatou Ba', doctorId: 'd3', doctorName: 'Dr. Astou Seck', speciality: 'Pédiatrie', dateTime: DateTime.now().subtract(const Duration(days: 1)), status: AppointmentStatus.completed, notes: '', reason: 'Suivi enfant'),
  Appointment(id: 'a4', patientId: 'p4', patientName: 'Mamadou Diallo', doctorId: 'd4', doctorName: 'Dr. Omar Fall', speciality: 'Gynécologie', dateTime: DateTime.now().add(const Duration(days: 2)), status: AppointmentStatus.cancelled, notes: '', reason: 'Annulé'),
  Appointment(id: 'a5', patientId: 'p5', patientName: 'Khady Diouf', doctorId: 'd5', doctorName: 'Dr. Aïcha Kane', speciality: 'Dermatologie', dateTime: DateTime.now().add(const Duration(days: 4)), status: AppointmentStatus.pending, notes: '', reason: 'Allergie'),
];

final mockConsultations = <Consultation>[
  Consultation(id: 'c1', patientName: 'Aminata Sow', doctorName: 'Dr. Fatou Ndiaye', diagnosis: 'Hypertension stabilisée', date: DateTime.now().subtract(const Duration(days: 3)), medications: const ['Amlodipine', 'Aspirine']),
  Consultation(id: 'c2', patientName: 'Cheikh Ndiaye', doctorName: 'Dr. Moussa Diop', diagnosis: 'Migraine chronique', date: DateTime.now().subtract(const Duration(days: 1)), medications: const ['Ibuprofène']),
];

final mockStock = <MedicalItem>[
  MedicalItem(id: 's1', name: 'Paracétamol', unit: 'boîte', type: MedicalItemType.medication, quantity: 40, minQuantity: 30, manufacturer: 'PharmaSN', expiryDate: DateTime.now().add(const Duration(days: 200))),
  MedicalItem(id: 's2', name: 'Seringues', unit: 'pcs', type: MedicalItemType.consumable, quantity: 8, minQuantity: 20, manufacturer: 'MediPro'),
  MedicalItem(id: 's3', name: 'Moniteur ECG', unit: 'unité', type: MedicalItemType.equipment, quantity: 1, minQuantity: 1, manufacturer: 'CardioTech'),
  MedicalItem(id: 's4', name: 'Amoxicilline', unit: 'boîte', type: MedicalItemType.medication, quantity: 0, minQuantity: 15, manufacturer: 'BioMed', expiryDate: DateTime.now().add(const Duration(days: 60))),
  MedicalItem(id: 's5', name: 'Insuline', unit: 'flacon', type: MedicalItemType.medication, quantity: 5, minQuantity: 12, manufacturer: 'NovoMed', expiryDate: DateTime.now().subtract(const Duration(days: 1))),
  MedicalItem(id: 's6', name: 'Gants stériles', unit: 'paquet', type: MedicalItemType.consumable, quantity: 55, minQuantity: 20, manufacturer: 'SafeCare'),
  MedicalItem(id: 's7', name: 'Fauteuil roulant', unit: 'unité', type: MedicalItemType.equipment, quantity: 2, minQuantity: 1, manufacturer: 'RehabPlus'),
  MedicalItem(id: 's8', name: 'Pansements', unit: 'boîte', type: MedicalItemType.consumable, quantity: 10, minQuantity: 30, manufacturer: 'MedPanse'),
];
