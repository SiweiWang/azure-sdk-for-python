# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require 'uri'
require 'cgi'
require 'date'
require 'json'
require 'base64'
require 'erb'
require 'securerandom'
require 'time'
require 'timeliness'
require 'faraday'
require 'faraday-cookie_jar'
require 'concurrent'
require 'ms_rest'
require 'generated/azure_mgmt_powerbi_embedded/module_definition'
require 'generated/azure_mgmt_powerbi_embedded/version'
require 'ms_rest_azure'

module Azure::ARM::PowerBiEmbedded
  autoload :WorkspaceCollections,                               'generated/azure_mgmt_powerbi_embedded/workspace_collections.rb'
  autoload :Workspaces,                                         'generated/azure_mgmt_powerbi_embedded/workspaces.rb'
  autoload :PowerBIEmbeddedManagementClient,                    'generated/azure_mgmt_powerbi_embedded/power_biembedded_management_client.rb'

  module Models
    autoload :Error,                                              'generated/azure_mgmt_powerbi_embedded/models/error.rb'
    autoload :ErrorDetail,                                        'generated/azure_mgmt_powerbi_embedded/models/error_detail.rb'
    autoload :WorkspaceCollectionList,                            'generated/azure_mgmt_powerbi_embedded/models/workspace_collection_list.rb'
    autoload :WorkspaceCollection,                                'generated/azure_mgmt_powerbi_embedded/models/workspace_collection.rb'
    autoload :AzureSku,                                           'generated/azure_mgmt_powerbi_embedded/models/azure_sku.rb'
    autoload :WorkspaceList,                                      'generated/azure_mgmt_powerbi_embedded/models/workspace_list.rb'
    autoload :Workspace,                                          'generated/azure_mgmt_powerbi_embedded/models/workspace.rb'
    autoload :OperationList,                                      'generated/azure_mgmt_powerbi_embedded/models/operation_list.rb'
    autoload :Operation,                                          'generated/azure_mgmt_powerbi_embedded/models/operation.rb'
    autoload :Display,                                            'generated/azure_mgmt_powerbi_embedded/models/display.rb'
    autoload :WorkspaceCollectionAccessKeys,                      'generated/azure_mgmt_powerbi_embedded/models/workspace_collection_access_keys.rb'
    autoload :WorkspaceCollectionAccessKey,                       'generated/azure_mgmt_powerbi_embedded/models/workspace_collection_access_key.rb'
    autoload :CreateWorkspaceCollectionRequest,                   'generated/azure_mgmt_powerbi_embedded/models/create_workspace_collection_request.rb'
    autoload :UpdateWorkspaceCollectionRequest,                   'generated/azure_mgmt_powerbi_embedded/models/update_workspace_collection_request.rb'
    autoload :CheckNameRequest,                                   'generated/azure_mgmt_powerbi_embedded/models/check_name_request.rb'
    autoload :CheckNameResponse,                                  'generated/azure_mgmt_powerbi_embedded/models/check_name_response.rb'
    autoload :MigrateWorkspaceCollectionRequest,                  'generated/azure_mgmt_powerbi_embedded/models/migrate_workspace_collection_request.rb'
    autoload :AccessKeyName,                                      'generated/azure_mgmt_powerbi_embedded/models/access_key_name.rb'
    autoload :CheckNameReason,                                    'generated/azure_mgmt_powerbi_embedded/models/check_name_reason.rb'
  end
end
