default["apache"]["indexfile"] = "index.html"

case node["platform"]
when "centos"
          default["apache"]["package"] = "httpd"
when "ubuntu"
          default["apache"]["package"] =  "apache2
        
