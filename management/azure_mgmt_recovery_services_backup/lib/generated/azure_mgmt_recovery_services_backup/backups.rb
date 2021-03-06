# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesBackup
  #
  # Backups
  #
  class Backups
    include Azure::ARM::RecoveryServicesBackup::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Backups class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [RecoveryServicesBackupClient] reference to the RecoveryServicesBackupClient
    attr_reader :client

    #
    # Triggers backup for specified backed up item. This is an asynchronous
    # operation. To know the status of the operation, call
    # GetProtectedItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Backup item for which backup needs to be
    # triggered.
    # @param resource_backup_request [BackupRequestResource] resource backup
    # request
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def trigger(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_backup_request, custom_headers = nil)
      response = trigger_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_backup_request, custom_headers).value!
      nil
    end

    #
    # Triggers backup for specified backed up item. This is an asynchronous
    # operation. To know the status of the operation, call
    # GetProtectedItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Backup item for which backup needs to be
    # triggered.
    # @param resource_backup_request [BackupRequestResource] resource backup
    # request
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def trigger_with_http_info(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_backup_request, custom_headers = nil)
      trigger_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_backup_request, custom_headers).value!
    end

    #
    # Triggers backup for specified backed up item. This is an asynchronous
    # operation. To know the status of the operation, call
    # GetProtectedItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Backup item for which backup needs to be
    # triggered.
    # @param resource_backup_request [BackupRequestResource] resource backup
    # request
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def trigger_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_backup_request, custom_headers = nil)
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, 'vault_name is nil' if vault_name.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'fabric_name is nil' if fabric_name.nil?
      fail ArgumentError, 'container_name is nil' if container_name.nil?
      fail ArgumentError, 'protected_item_name is nil' if protected_item_name.nil?
      fail ArgumentError, 'resource_backup_request is nil' if resource_backup_request.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = BackupRequestResource.mapper()
      request_content = @client.serialize(request_mapper,  resource_backup_request, 'resource_backup_request')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/Subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/{vaultName}/backupFabrics/{fabricName}/protectionContainers/{containerName}/protectedItems/{protectedItemName}/backup'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'vaultName' => vault_name,'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id,'fabricName' => fabric_name,'containerName' => container_name,'protectedItemName' => protected_item_name},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

  end
end
