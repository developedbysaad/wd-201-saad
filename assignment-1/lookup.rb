def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# ..
# ..
# FILL YOUR CODE HERE

def parse_dns(dns_raw)
  dns_record_hash = {}
  dns_filter = dns_raw.reject { |l| l.start_with?("#") || l.strip.empty? }
  dns_filter.map { |line|
    dns_hash = {}
    dns_hash[:type] = line.split(", ")[0]
    dns_hash[:destination] = line.split.last
    dns_record_hash[line.split(", ")[1]] = dns_hash
  }
  dns_record_hash
end

def resolve(dns_records, lookup_chain, domain)
  source = dns_records[domain]
  if !source
    lookup_chain.push("No Records found for #{domain}")
  elsif source[:type] == "CNAME"
    lookup_chain.push(source[:destination])
    resolve(dns_records, lookup_chain, source[:destination])
  elsif source[:type] == "A"
    lookup_chain.push(source[:destination])
  end
end

# ..
# ..

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
