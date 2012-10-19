def parse_markdown(path)
  results = []
  contents = IO.read(path)
  ideas = contents.scan(/^##[^#]+/m)
  ideas.map! do |item|
    res = item.split(/\n/)
    first = (res[0].strip)[3..-1]
    res = res[1..-1]
    res.map! do |item|
      item = item.strip
    end
    second = res.join(%'\n').strip
    results << [first, second]
  end
  return results
end

def parse(path)
  return parse_markdown(path)
end
