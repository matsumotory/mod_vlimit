#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.text.rb [http[s]://]hostname[:port]/path
#
# TEST PARAMETERS
#
# "TargetURL"
# "TargetHost"
# "TargetPort"
# "TargetPath"
# "TargetisSSL"
# "TargetServerSoftware"
# "TargetServerHost"
# "TargetServerPort"
# "TargetServerSSLInfo"         # if use SSL
# "TargetDocumentPath"
# "TargetDocumentLength"
# "TimeTakenforTests"
# "CompleteRequests"
# "FailedRequests"
# "ConnetcErrors"               # if FailedRequests > 0
# "ReceiveErrors"               # if FailedRequests > 0
# "LengthErrors"                # if FailedRequests > 0
# "ExceptionsErrors"            # if FailedRequests > 0
# "WriteErrors"
# "Non2xxResponses"             # if Non2xxResponse > 0
# "KeepAliveRequests"
# "TotalTransferred"
# "TotalBodySent"               # if body send
# "HTMLTransferred"
# "RequestPerSecond"
# "TimePerConcurrentRequest"
# "TimePerRequest"
# "TransferRate"
#

module Kernel
  def test_suite &blk
    @@r = get_config
    @@t = blk
    @@result = true
  end
  def bln_color val
    (val) ? "[\e[33m#{val}\e[m]" : "[\e[36m#{val}\e[m]"
  end
  def should_be val
    ret = @@r[self] == val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be #{val}"
    @@result = ret if ret == false
  end
  def should_be_over val
    ret = @@r[self] > val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be over #{val}"
    @@result = ret if ret == false
  end
  def should_be_under val
    ret = @@r[self] < val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be under #{val}"
    @@result = ret if ret == false
  end
  def test_run
    @@t.call
    puts "\ntest suites: #{bln_color @@result}\n"
  end
end

#print <<EOS
#======================================================================
#This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
#Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby
#
#                            TEST PHASE
#
#======================================================================
#EOS

test_suite do
  "FailedRequests".should_be                   1
  "CompleteRequests".should_be                 1
  "Non2xxResponses".should_be                  1
end

test_run
