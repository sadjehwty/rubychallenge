def stego s,out="out.png"
  m=s.length*10
  ll=0
  ll=rand m while ll<=s.length
  l=sqrt(ll).ceil
  ll=l*l
  bool,a=[],[]
  (0...ll).each do |i| bool<< i end
  i,dx,dy,x,y=0,0,0,0,0
  q=(QuantumRange+1)/256
  s.each_byte do |b|
    bool.delete x+y*l
    begin
      i=bool[rand(bool.length)]
      tx,ty=i%l,i/l
      dx,dy=tx-x,ty-y
    end until dx.abs<=127 && dy.abs<=127 && dx.abs>0 && dy.abs>0 && x+dx>=0 && y+dy>=0 && x+dx<l && y+dy<l
    a[x+y*l]= Pixel.new(q*(dx>0?dx:256+dx),q*(dy>0?dy:256+dy),q*b,0)
    x+=dx
    y+=dy
  end
  bool.delete x+y*l
  a[x+y*l]= Pixel.new(0,0,0,0)
  bool.each do |i|
    a[i]= Pixel.new(q*rand(256),q*rand(256),q*rand(256),0)
  end
  img=Image.new l,l
  img.store_pixels 0,0,l,l,a
  img.write out
end

def unstego file="out.png",out="unstego.txt"
  img=Image.read(file).first
  l=img.columns
  img=img.get_pixels 0,0,l,l
  q=(QuantumRange+1)/256
  s,i="",0
  until img[i].blue==0
    s<< (img[i].blue/q).chr
    dx,dy=(img[i].red/q),(img[i].green/q)
    dx,dy=dx>127?dx-256:dx,dy>127?dy-256:dy
    i+=dx+dy*l
  end
  File.open(out,"wb"){|f| f.write s}
end

def error
  puts "ERROR!"
end
def input
  puts "Messaggio?"
  STDOUT.flush
  STDIN.gets.chomp
end

require 'rubygems'
require 'RMagick'
include Magick
include Math
if ARGV.length>0
  if "c+".index(ARGV[0])
    stego input,*ARGV[1..-1]
  elsif "d-".index(ARGV[0])
    unstego *ARGV[1..-1]
  else
    error
  end
else
  stego input
end
