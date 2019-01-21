require 'yaml'

puts <<"HTML"
<h1>AWS Icon</h1>
<p><a href="https://github.com/nazoking/aws-slack-emojipack">https://github.com/nazoking/aws-slack-emojipack</a> forked from aendrew/aws-slack-emojipack</p>
<style>
.icon{
  display:inline-block;

}
.icon > span{
  display:block;
}
</style>
HTML

Dir.glob("[^_]*.yaml"){ |f|
  m = YAML.load(open(f))
  puts "<h2>#{m["title"]}</h2><div>"
  m["emojis"].each{|e|
    src = e["src"].sub("http://aendrew.com/aws-slack-emojipack/", "https://nazoking.github.io/aws-slack-emojipack/")
    next if src =~ /i\.imgur\.com/
    name = e["name"].sub("aws-","").sub("amazon","")
    name = e["src"].sub(/^.*\//, "").sub(/\.png/, "").sub(/^\w*_/,"").sub(/^(AWS|Amazon)/,"")
    puts %!<a href="#{src}" class="icon"><img src="#{src}" alt="#{name}" /><span>#{name}</span></a>!
  }
  puts "</div>"

}
