require "open3"

Open3.popen3("echo a; sleep 1; echo b; sort >&2; sleep 3") do |i, o, e, w|
  i.write "foo\nbar\nbaz\n"
  i.close
  o.each do |line| p line end #=> "a\n",  "b\n"
  e.each do |line| p line end #=> "bar\n", "baz\n", "foo\n"
  p w.value #=> #<Process::Status: pid 32682 exit 0>
end
