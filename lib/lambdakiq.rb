require 'json'
require 'digest'
require 'active_job'
require 'active_job/queue_adapters'
require 'active_support/all'
require 'lambdakiq/version'
require 'lambdakiq/error'
require 'lambdakiq/adapter'
require 'lambdakiq/client'
require 'lambdakiq/queue'
require 'lambdakiq/message'
require 'lambdakiq/event'
require 'lambdakiq/job'
require 'lambdakiq/record'
require 'lambdakiq/backoff'
require 'lambdakiq/metrics'
require 'lambdakiq/worker'
require 'rails/railtie'
require 'lambdakiq/railtie'

module Lambdakiq

  def cmd(event:, context:)
    handler(event)
  end

  def handler(event)
    Job.handler(event)
  end

  def jobs?(event)
    Event.jobs?(event)
  end

  def client
    @client ||= Client.new
  end

  def config
    Lambdakiq::Railtie.config.lambdakiq
  end

  extend self

end
