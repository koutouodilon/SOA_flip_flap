require_relative 'tsv_buddy'
require_relative 'yaml_buddy'
require 'yaml'

# Converts tabular data between storage formats
class FlipFlap
  include TsvBuddy
  include YamlBuddy
  # Do NOT create an initialize method

  attr_reader :data

  def self.input_formats
    outputs = method_start_with(/^take_/)
    outputs ? outputs.map { |method| method[5..-1] } : []
  end

  def self.method_start_with(start)
    method_names = instance_methods.map(&:to_s)
    method_names.select { |method| method.match(start) }
  end
end
