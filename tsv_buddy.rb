# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  TAB = "\t".freeze
  NEWLINE = "\n".freeze

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    tsv_source = tsv.split(NEWLINE)
    header = tsv_source[0].split(TAB)
    tsv_source.each_with_index do |line, index|
      next if index.zero?
      @data.push(hash_tsv_line(line, header))
    end
    @data
  end

  def hash_tsv_line(line, header)
    row = {}
    line.split(TAB).each_with_index { |col, id| row[header[id]] = col }
    row
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output = to_tsv_header << NEWLINE
    @data.map { |line| output << line.values.join(TAB) << NEWLINE }
    output
  end

  def to_tsv_header
    @data[0].keys.join(TAB)
  end
end
