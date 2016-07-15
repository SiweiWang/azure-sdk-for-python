# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MachineLearning
  #
  # These APIs allow end users to operate on Azure Machine Learning Web
  # Services resources. They support the following operations:<ul><li>Create
  # or update a web service</li><li>Get a web service</li><li>Patch a web
  # service</li><li>Delete a web service</li><li>Get All Web Services in a
  # Resource Group </li><li>Get All Web Services in a
  # Subscription</li><li>Get Web Services Keys</li></ul>
  #
  class WebServices
    include Azure::ARM::MachineLearning::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the WebServices class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the AzureMLWebServicesManagementClient
    attr_reader :client

    #
    # Creates or updates a new Azure ML web service or update an existing one.
    #
    # @param create_or_update_payload [WebService] The payload to create or update
    # the Azure ML web service.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def create_or_update(create_or_update_payload, resource_group_name, web_service_name, custom_headers = nil)
      # Send request
      promise = begin_create_or_update_async(create_or_update_payload, resource_group_name, web_service_name, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          result_mapper = WebService.mapper()
          parsed_response = @client.deserialize(result_mapper, parsed_response, 'parsed_response')
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Creates or updates a new Azure ML web service or update an existing one.
    #
    # @param create_or_update_payload [WebService] The payload to create or update
    # the Azure ML web service.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [WebService] operation results.
    #
    def begin_create_or_update(create_or_update_payload, resource_group_name, web_service_name, custom_headers = nil)
      response = begin_create_or_update_async(create_or_update_payload, resource_group_name, web_service_name, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Creates or updates a new Azure ML web service or update an existing one.
    #
    # @param create_or_update_payload [WebService] The payload to create or update
    # the Azure ML web service.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_create_or_update_with_http_info(create_or_update_payload, resource_group_name, web_service_name, custom_headers = nil)
      begin_create_or_update_async(create_or_update_payload, resource_group_name, web_service_name, custom_headers).value!
    end

    #
    # Creates or updates a new Azure ML web service or update an existing one.
    #
    # @param create_or_update_payload [WebService] The payload to create or update
    # the Azure ML web service.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_create_or_update_async(create_or_update_payload, resource_group_name, web_service_name, custom_headers = nil)
      fail ArgumentError, 'create_or_update_payload is nil' if create_or_update_payload.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'web_service_name is nil' if web_service_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = WebService.mapper()
      request_content = @client.serialize(request_mapper,  create_or_update_payload, 'create_or_update_payload')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices/{webServiceName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'webServiceName' => web_service_name},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :put, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = WebService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = WebService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Retrieve an Azure ML web service definition by its subscription, resource
    # group and name.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [WebService] operation results.
    #
    def get(resource_group_name, web_service_name, custom_headers = nil)
      response = get_async(resource_group_name, web_service_name, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Retrieve an Azure ML web service definition by its subscription, resource
    # group and name.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, web_service_name, custom_headers = nil)
      get_async(resource_group_name, web_service_name, custom_headers).value!
    end

    #
    # Retrieve an Azure ML web service definition by its subscription, resource
    # group and name.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, web_service_name, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'web_service_name is nil' if web_service_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices/{webServiceName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'webServiceName' => web_service_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = WebService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Patch an existing Azure ML web service resource.
    #
    # @param patch_payload [WebService] The payload to patch the Azure ML web
    # service with.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def patch(patch_payload, resource_group_name, web_service_name, custom_headers = nil)
      # Send request
      promise = begin_patch_async(patch_payload, resource_group_name, web_service_name, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          result_mapper = WebService.mapper()
          parsed_response = @client.deserialize(result_mapper, parsed_response, 'parsed_response')
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Patch an existing Azure ML web service resource.
    #
    # @param patch_payload [WebService] The payload to patch the Azure ML web
    # service with.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [WebService] operation results.
    #
    def begin_patch(patch_payload, resource_group_name, web_service_name, custom_headers = nil)
      response = begin_patch_async(patch_payload, resource_group_name, web_service_name, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Patch an existing Azure ML web service resource.
    #
    # @param patch_payload [WebService] The payload to patch the Azure ML web
    # service with.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_patch_with_http_info(patch_payload, resource_group_name, web_service_name, custom_headers = nil)
      begin_patch_async(patch_payload, resource_group_name, web_service_name, custom_headers).value!
    end

    #
    # Patch an existing Azure ML web service resource.
    #
    # @param patch_payload [WebService] The payload to patch the Azure ML web
    # service with.
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_patch_async(patch_payload, resource_group_name, web_service_name, custom_headers = nil)
      fail ArgumentError, 'patch_payload is nil' if patch_payload.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'web_service_name is nil' if web_service_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = WebService.mapper()
      request_content = @client.serialize(request_mapper,  patch_payload, 'patch_payload')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices/{webServiceName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'webServiceName' => web_service_name},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :patch, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = WebService.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Remove an existing Azure ML web service.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def remove(resource_group_name, web_service_name, custom_headers = nil)
      # Send request
      promise = begin_remove_async(resource_group_name, web_service_name, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Remove an existing Azure ML web service.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def begin_remove(resource_group_name, web_service_name, custom_headers = nil)
      response = begin_remove_async(resource_group_name, web_service_name, custom_headers).value!
      nil
    end

    #
    # Remove an existing Azure ML web service.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_remove_with_http_info(resource_group_name, web_service_name, custom_headers = nil)
      begin_remove_async(resource_group_name, web_service_name, custom_headers).value!
    end

    #
    # Remove an existing Azure ML web service.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_remove_async(resource_group_name, web_service_name, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'web_service_name is nil' if web_service_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices/{webServiceName}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'webServiceName' => web_service_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :delete, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Get the access keys of a particular Azure ML web service
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [WebServiceKeys] operation results.
    #
    def list_keys(resource_group_name, web_service_name, custom_headers = nil)
      response = list_keys_async(resource_group_name, web_service_name, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get the access keys of a particular Azure ML web service
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_keys_with_http_info(resource_group_name, web_service_name, custom_headers = nil)
      list_keys_async(resource_group_name, web_service_name, custom_headers).value!
    end

    #
    # Get the access keys of a particular Azure ML web service
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param web_service_name [String] The Azure ML web service name which you
    # want to reach.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_keys_async(resource_group_name, web_service_name, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'web_service_name is nil' if web_service_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices/{webServiceName}/listKeys'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'webServiceName' => web_service_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = WebServiceKeys.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Retrieve all Azure ML web services in a given resource group.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param skiptoken [String] Continuation token for pagination.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PaginatedWebServicesList] operation results.
    #
    def list_in_resource_group(resource_group_name, skiptoken = nil, custom_headers = nil)
      response = list_in_resource_group_async(resource_group_name, skiptoken, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Retrieve all Azure ML web services in a given resource group.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param skiptoken [String] Continuation token for pagination.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_in_resource_group_with_http_info(resource_group_name, skiptoken = nil, custom_headers = nil)
      list_in_resource_group_async(resource_group_name, skiptoken, custom_headers).value!
    end

    #
    # Retrieve all Azure ML web services in a given resource group.
    #
    # @param resource_group_name [String] Name of the resource group.
    # @param skiptoken [String] Continuation token for pagination.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_in_resource_group_async(resource_group_name, skiptoken = nil, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.MachineLearning/webServices'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name},
          query_params: {'api-version' => @client.api_version,'$skiptoken' => skiptoken},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = PaginatedWebServicesList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Retrieve all Azure ML web services in the current Azure subscription.
    #
    # @param skiptoken [String] Continuation token for pagination.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PaginatedWebServicesList] operation results.
    #
    def list(skiptoken = nil, custom_headers = nil)
      response = list_async(skiptoken, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Retrieve all Azure ML web services in the current Azure subscription.
    #
    # @param skiptoken [String] Continuation token for pagination.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(skiptoken = nil, custom_headers = nil)
      list_async(skiptoken, custom_headers).value!
    end

    #
    # Retrieve all Azure ML web services in the current Azure subscription.
    #
    # @param skiptoken [String] Continuation token for pagination.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(skiptoken = nil, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.MachineLearning/webServices'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version,'$skiptoken' => skiptoken},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = PaginatedWebServicesList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
