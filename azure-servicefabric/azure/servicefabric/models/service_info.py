# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from msrest.serialization import Model


class ServiceInfo(Model):
    """Information about a Service Fabric service.

    :param id:
    :type id: str
    :param name: Full hierarchical name of the service in URI format starting
     with `fabric:`.
    :type name: str
    :param type_name: The name of the service type as specified in the
     service manifest.
    :type type_name: str
    :param manifest_version: The version of the service manifest.
    :type manifest_version: str
    :param health_state: Possible values include: 'Invalid', 'Ok', 'Warning',
     'Error', 'Unknown'
    :type health_state: str
    :param service_status: Possible values include: 'Unknown', 'Active',
     'Upgrading', 'Deleting', 'Creating', 'Failed'
    :type service_status: str
    :param is_service_group: Whether the service is in a service group.
    :type is_service_group: bool
    :param ServiceKind: Polymorphic Discriminator
    :type ServiceKind: str
    """ 

    _validation = {
        'ServiceKind': {'required': True},
    }

    _attribute_map = {
        'id': {'key': 'Id', 'type': 'str'},
        'name': {'key': 'Name', 'type': 'str'},
        'type_name': {'key': 'TypeName', 'type': 'str'},
        'manifest_version': {'key': 'ManifestVersion', 'type': 'str'},
        'health_state': {'key': 'HealthState', 'type': 'str'},
        'service_status': {'key': 'ServiceStatus', 'type': 'str'},
        'is_service_group': {'key': 'IsServiceGroup', 'type': 'bool'},
        'ServiceKind': {'key': 'ServiceKind', 'type': 'str'},
    }

    _subtype_map = {
        'ServiceKind': {'Stateful': 'StatefulServiceInfo', 'Stateless': 'StatelessServiceInfo'}
    }

    def __init__(self, id=None, name=None, type_name=None, manifest_version=None, health_state=None, service_status=None, is_service_group=None):
        self.id = id
        self.name = name
        self.type_name = type_name
        self.manifest_version = manifest_version
        self.health_state = health_state
        self.service_status = service_status
        self.is_service_group = is_service_group
        self.ServiceKind = None