# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with YAML data into @data
  # parameter: yaml - a String in YAML format
  def take_yaml(yaml)
    @data = []
    yaml_source = YAML.safe_load(yaml)
    yaml_source.each do |line|
      @data.push(hash_yaml_line(line))
    end
    @data
  end

  def hash_yaml_line(line)
    row = {}
    line.each_with_index { |(key, value), _| row[key] = value }
    row
  end

  # to_yaml: converts @data into yaml string
  # returns: String in YAML format
  def to_yaml
    @data.to_yaml
  end
end
