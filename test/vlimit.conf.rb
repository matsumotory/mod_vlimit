#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.test.rb[http[s]://]hostname[:port]/path
#
# add_config(
#     "TotalRequests"         => 100,                       # int
#     "Concurrency"           => 10,                        # int max 20000
#     "KeepAlive"             => true,                      # true or false or nil
#     "VerboseLevel"          => 1,                         # int 1 ~ 5
#     "ShowProgress"          => true,                      # true, false or nil
#     "ShowPercentile"        => true,                      # true, false or nil
#     "ShowConfidence"        => true,                      # true, false or nil
#     "WaitSocketError"       => true,                      # true, false or nil
#     "RequestTimeOut"        => 30,                        # int sec
#     "BechmarkTimelimit"     => 50000,                     # int sec
#     "WindowSize"            => nil,                       # int byte
#     "HeadMethodOnly"        => false,                     # true, false or nil
#     "Postfile"              => nil,                       # './post.txt',
#     "Putfile"               => nil,                       # './put.txt',
#     "ContentType"           => nil,                       # 'application/x-www-form-urlencoded',
#     "OutputGnuplotFile"     => nil,                       # './gnu.txt'
#     "OutputCSVFile"         => nil,                       # './csv.txt'
#     "AddCookie"             => nil,                       # 'Apache=1234'
#     "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
#     "BasicAuth"             => nil,                       # 'user:pass'
#     "Proxy"                 => nil,                       # 'proxy[:port]'
#     "ProxyAuth"             => nil,                       # 'user:pass'
#     "OutputHtml"            => false,                     # true, false or nil
#     "SilentMode"            => false,                     # true, false or nil
#     "BindAddress"           => nil,                       # 'matsumoto-r.jp'
#     "SSLCipher"             => 'DHE-RSA-AES128-SHA',      # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
#     "SSLProtocol"           => 'SSL3',                    # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
# )


#print <<EOS
#======================================================================
#This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
#Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby
#
#                          CONFIG PHASE
#
#======================================================================
#  Target Information  URL: #{get_config('TargetURL').to_s}
#  Target Information HOST: #{get_config('TargetHost').to_s}
#  Target Information PORT: #{get_config('TargetPort').to_s}
#  Target Information PATH: #{get_config('TargetPath').to_s}
#  Target Information  SSL: #{get_config('TargetisSSL').to_s}
#EOS

# defined ab config pattern
add_config(
  "TotalRequests"         => 2,                         # int
  "Concurrency"           => 2,                         # int max 20000
  "KeepAlive"             => true,                      # true or false or nil
  "VerboseLevel"          => 1,                         # int 1 ~ 5
  "SilentMode"            => true,
)
