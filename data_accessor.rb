require 'yaml'

class DataAccessor
  def add_hit(host)
    hits = parse_file
    today = Time.now.strftime('%Y-%m-%d')
    hits[today] ||= {}
    hits[today][host] ||= 0
    hits[today][host] += 1
    
    save_file(hits)
    
    hits[today][host]
  end
  
  private
  FILENAME = 'data/hits.yaml'
  
  def parse_file
    return {} unless File.exists?(FILENAME)
    YAML.load_file(FILENAME)
  end
  
  def save_file(hits)
    File.write(FILENAME, hits.to_yaml)
  end
end