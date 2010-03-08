#/usr/bin/ruby
require 'cgi'

cgi=CGI.new "html4Tr"

def next_not n
 ret=0
 i=217
 until i==n
  srand i
  i=rand 100000
  ret+=1
 end
 srand i
 [ret,rand(100000)]
end

if cgi.params.length>0 and (!cgi.params['nothing'].first.nil? or !cgi.params['busynothing'].first.nil?)
 if !cgi.params['nothing'].first.nil?
  cookie=CGI::Cookie.new('name' => 'info','value'=>"you+should+have+followed+busynothing...;","expires"=>Time.now+3600)
  n=cgi.params['nothing'].first
  srand n.to_i
  n=rand(100000).to_s
  case n
   when "65774"
    cgi.out{
     cgi.font("color"=>"red"){ "Your hands are getting tired "} +
     CGI::unescape("and the next nothing is #{n}")
    }
   when "93689"
    cgi.out{
     CGI::unescape("There maybe misleading numbers in the 
text. One example is 89213. Look only for the next nothing and the next nothing is #{n}")
    }
   when "27424"
    cgi.out{ CGI::unescape("Yes. Divide by two and keep going.")}
   when "94068"
    cgi.out{ CGI::unescape("peak.html")}
   else
    cgi.out("cookie"=>cookie){ CGI::unescape("and the next nothing is #{n}") }
  end
 else
  file="BZh91AY&SY\224:\342I\000\000!\031\200P\201\021\000\257g\236\240 \000hE=M\265#\320\324\321\342\215\006\251\372&S\324\323!\241\352i7h\233\232+\277`\"\305WX\341\255L\200\350V<\306\250\333H&32\030\250x\001\b!\215S\v\310\257\226KO\3122\260\361\275\035u\240\206\005\222s\260\222\304Bc\361w$S\205\t\tC\256$\220"
  i,n=next_not cgi.params['busynothing'].first.to_i
  cookie=CGI::Cookie.new('name'=>'info','value'=>file[i].chr,'expires'=>Time.now+3600)
  if i==0
   cgi.out("cookie"=>cookie){CGI::unescape("If you came here from level 4 - go back!<br>You should follow the obvious chain...<br><br>and the next busynothing is #{n}")}
  elsif i==file.length-1
   cgi.out("cookie"=>cookie){CGI::unescape("That\'s all folks!")}
  else
   cgi.out("cookie"=>cookie){ CGI::unescape("and the next busynothing is #{n}")}
  end
 end
else
 cgi.out{
  cgi.html{
   "\n"+
   cgi.head{
    "\n"+
    cgi.title{"follow the chain"} +"\n"+
    cgi.link({"rel"=>"stylesheet","type"=>"text/css","href"=>"../style.css"}) +"\n" 
   } +"\n"+
   cgi.body{
    "\n"+
    CGI::unescape("<!-- net/http may help. DON\'T TRY ALL NOTHINGS, since it will never 
end. 400 times is more than enough. -->") +"\n"+
    cgi.center{
     cgi.a("linkedlist.rbx?nothing=217"){
      cgi.img("src"=>"chainsaw.jpg","border"=>"0")
     } 
    } +"\n"+
    cgi.font("color"=>"gold"){
     "\n"+
     cgi.p{
      "\n"+
      CGI::unescape("Solutions to previous levels: ") +
      cgi.a("http://wiki.pythonchallenge.com/"){"Python Challenge wiki"} +"\n"
     } +"\n"+
    CGI::unescape("IRC: irc.freenode.net #pythonchallenge") +"\n"
    } +"\n"
   } +"\n"
  }+"\n"
 }
end
