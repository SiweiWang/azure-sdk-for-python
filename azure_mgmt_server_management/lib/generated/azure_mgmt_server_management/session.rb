# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::ServerManagement
  #
  # REST API for Azure Server Management Service
  #
  class Session
    include Azure::ARM::ServerManagement::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Session class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the ServerManagement
    attr_reader :client

    #
    # Creates a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param user_name [String] User name to be used to connect to node
    # @param password [String] Password associated with user name
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def create(resource_group_name, node_name, session, user_name = nil, password = nil, custom_headers = nil)
      # Send request
      promise = begin_create_async(resource_group_name, node_name, session, user_name, password, custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          result_mapper = SessionResource.mapper()
          parsed_response = @client.deserialize(result_mapper, parsed_response, 'parsed_response')
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Creates a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param user_name [String] User name to be used to connect to node
    # @param password [String] Password associated with user name
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [SessionResource] operation results.
    #
    def begin_create(resource_group_name, node_name, session, user_name = nil, password = nil, custom_headers = nil)
      response = begin_create_async(resource_group_name, node_name, session, user_name, password, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Creates a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param user_name [String] User name to be used to connect to node
    # @param password [String] Password associated with user name
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_create_with_http_info(resource_group_name, node_name, session, user_name = nil, password = nil, custom_headers = nil)
      begin_create_async(resource_group_name, node_name, session, user_name, password, custom_headers).value!
    end

    #
    # Creates a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param user_name [String] User name to be used to connect to node
    # @param password [String] Password associated with user name
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_create_async(resource_group_name, node_name, session, user_name = nil, password = nil, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'node_name is nil' if node_name.nil?
      fail ArgumentError, 'session is nil' if session.nil?

      session_parameters = SessionParameters.new
      unless user_name.nil? && password.nil?
        session_parameters.user_name = user_name
        session_parameters.password = password
      end

      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = SessionParameters.mapper()
      request_content = @client.serialize(request_mapper,  session_parameters, 'session_parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServerManagement/nodes/{nodeName}/sessions/{session}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'nodeName' => node_name,'session' => session},
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
        unless status_code == 200 || status_code == 201 || status_code == 202
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = SessionResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = SessionResource.mapper()
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
    # Deletes a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(resource_group_name, node_name, session, custom_headers = nil)
      response = delete_async(resource_group_name, node_name, session, custom_headers).value!
      nil
    end

    #
    # Deletes a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(resource_group_name, node_name, session, custom_headers = nil)
      delete_async(resource_group_name, node_name, session, custom_headers).value!
    end

    #
    # Deletes a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(resource_group_name, node_name, session, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'node_name is nil' if node_name.nil?
      fail ArgumentError, 'session is nil' if session.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServerManagement/nodes/{nodeName}/sessions/{session}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'nodeName' => node_name,'session' => session},
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
        unless status_code == 200 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [SessionResource] operation results.
    #
    def get(resource_group_name, node_name, session, custom_headers = nil)
      response = get_async(resource_group_name, node_name, session, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, node_name, session, custom_headers = nil)
      get_async(resource_group_name, node_name, session, custom_headers).value!
    end

    #
    # Gets a session for a node
    #
    # @param resource_group_name [String] The resource group name uniquely
    # identifies the resource group within the user subscriptionId.
    # @param node_name [String] The node name (256 characters maximum).
    # @param session [String] The sessionId from the user
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, node_name, session, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'node_name is nil' if node_name.nil?
      fail ArgumentError, 'session is nil' if session.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServerManagement/nodes/{nodeName}/sessions/{session}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'nodeName' => node_name,'session' => session},
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
          fail MsRest::HttpOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = SessionResource.mapper()
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
