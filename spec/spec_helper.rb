# frozen_string_literal: true
# encoding: utf-8

ENV['APPLICATION_ENV'] = 'test'

require 'rspec'
require 'rspec/mocks'
require 'rspec/expectations'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end
