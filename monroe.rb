
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
# monroe.rb

class Monroe
  def erb(filename, local = {})
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end

  def response(status, headers, body = '')
    body = yield if block_given?
    [status, headers, [body]]
  end
end
