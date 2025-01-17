import 'package:cybear_jinni/domain/devices/abstract_device/device_entity_abstract.dart';
import 'package:cybear_jinni/domain/devices/abstract_device/value_objects_core.dart';
import 'package:cybear_jinni/domain/devices/generic_smart_computer_device/generic_smart_computer_entity.dart';
import 'package:cybear_jinni/domain/devices/generic_smart_computer_device/generic_smart_computer_value_objects.dart';
import 'package:cybear_jinni/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_smart_computer_device_dtos.freezed.dart';
part 'generic_smart_computer_device_dtos.g.dart';

@freezed
abstract class GenericSmartComputerDeviceDtos
    implements _$GenericSmartComputerDeviceDtos, DeviceEntityDtoAbstract {
  factory GenericSmartComputerDeviceDtos({
    // @JsonKey(ignore: true)
    required String id,
    required String vendorUniqueId,
    required String? defaultName,
    required String? deviceStateGRPC,
    required String? senderDeviceOs,
    required String? senderDeviceModel,
    required String? senderId,
    required String? deviceTypes,
    required String? compUuid,
    required String? deviceVendor,
    required String? smartComputerSuspendState,
    required String? smartComputerShutDownState,
    String? deviceDtoClass,
    String? stateMassage,

    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _GenericSmartComputerDeviceDtos;

  GenericSmartComputerDeviceDtos._();

  factory GenericSmartComputerDeviceDtos.fromDomain(
    GenericSmartComputerDE genericSmartComputerDE,
  ) {
    return GenericSmartComputerDeviceDtos(
      deviceDtoClass: (GenericSmartComputerDeviceDtos).toString(),
      id: genericSmartComputerDE.uniqueId.getOrCrash(),
      vendorUniqueId: genericSmartComputerDE.vendorUniqueId.getOrCrash(),
      defaultName: genericSmartComputerDE.defaultName.getOrCrash(),
      deviceStateGRPC: genericSmartComputerDE.deviceStateGRPC.getOrCrash(),
      stateMassage: genericSmartComputerDE.stateMassage.getOrCrash(),
      senderDeviceOs: genericSmartComputerDE.senderDeviceOs.getOrCrash(),
      senderDeviceModel: genericSmartComputerDE.senderDeviceModel.getOrCrash(),
      senderId: genericSmartComputerDE.senderId.getOrCrash(),
      smartComputerSuspendState:
          genericSmartComputerDE.smartComputerSuspendState!.getOrCrash(),
      smartComputerShutDownState:
          genericSmartComputerDE.smartComputerShutDownState!.getOrCrash(),
      deviceTypes: genericSmartComputerDE.deviceTypes.getOrCrash(),
      compUuid: genericSmartComputerDE.compUuid.getOrCrash(),
      deviceVendor: genericSmartComputerDE.deviceVendor.getOrCrash(),
      // serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  factory GenericSmartComputerDeviceDtos.fromJson(Map<String, dynamic> json) =>
      _$GenericSmartComputerDeviceDtosFromJson(json);

  @override
  final String deviceDtoClassInstance =
      (GenericSmartComputerDeviceDtos).toString();

  @override
  DeviceEntityAbstract toDomain() {
    return GenericSmartComputerDE(
      uniqueId: CoreUniqueId.fromUniqueString(id),
      vendorUniqueId: VendorUniqueId.fromUniqueString(vendorUniqueId),
      defaultName: DeviceDefaultName(defaultName),
      deviceStateGRPC: DeviceState(deviceStateGRPC),
      stateMassage: DeviceStateMassage(stateMassage),
      senderDeviceOs: DeviceSenderDeviceOs(senderDeviceOs),
      senderDeviceModel: DeviceSenderDeviceModel(senderDeviceModel),
      senderId: DeviceSenderId.fromUniqueString(senderId),
      deviceVendor: DeviceVendor(deviceVendor),
      compUuid: DeviceCompUuid(compUuid),
      smartComputerSuspendState:
          GenericSmartComputerSuspendState(smartComputerSuspendState),
      smartComputerShutDownState:
          GenericSmartComputerShutdownState(smartComputerShutDownState),
    );
  }
}
