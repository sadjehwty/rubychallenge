require 'cgi'

cgi=CGI.new 'html4Tr'
b=cgi.cookies['info'].first.nil?
b=!b && cgi.cookies['info'].first == "the flowers are on their way"
cgi.out{
 cgi.html{
  "\n"+
  cgi.head{
   "\n"+
   cgi.title{"it\'s me. what do you want?"} +"\n"+
   cgi.link({'rel'=>"stylesheet",'type'=>"text/css",'href'=>"../style.css"})+"\n"
  } +"\n"+
  cgi.body{
   "\n"+
   cgi.br+cgi.br+"\n"+
   cgi.center{
    cgi.font("color"=>"gold"){
     "\n"+
    cgi.img("src"=>"leopold.jpg","border"=>"0")}+"\n"+
    cgi.br+cgi.br+"\n"+
    if b
     CGI::unescape("oh well, don\'t you dare to forget the balloons")
    else
     ""
    end
   }
  }
 }
}
