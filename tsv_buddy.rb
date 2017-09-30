# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  TAB = "\t".freeze
  NEWLINE = "\n".freeze

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    data_rows, header = load_tsv(tsv)
    @data = data_rows.map { |row| hash_tsv_line(row, header) }
    @data
  end

  def load_tsv(tsv)
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    header = rows.first
    [rows[1..-1], header]
  end

  def hash_tsv_line(line, header)
    row = {}
    line.each_with_index { |col, id| row[header[id]] = col }
    row
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output = to_tsv_header << NEWLINE
    @data.each { |line| output << format_to_tsv(line) << NEWLINE }
    output
  end

  def format_to_tsv(line)
    line.values.join(TAB)
  end

  def to_tsv_header
    @data.first.keys.join(TAB)
  end
end
