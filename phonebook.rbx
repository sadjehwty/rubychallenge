require 'xmlrpc/server.rb'

# create a servlet to handle XML-RPC requests:
servlet=XMLRPC::CGIServer.new
servlet.add_handler("phone") do |name|
 if name == "Bert"
  "555-ITALY"
 elsif name == "Leopold"
  "555-VIOLIN"
 else
  "He is not the evil"
 end
end
servlet.serve
