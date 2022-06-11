['TERM', 'USR2'].each do |sig|
    Signal.trap(sig) do
      pid = Process.pid
      prefix = "[unicorn_murder_logger] pid: #{pid}"
      STDERR.puts("#{prefix} Received #{sig} at #{Time.now}. Dumping threads:")
      Thread.list.each do |t|
        trace = t.backtrace.join("\n#{prefix}")
        STDERR.puts("#{prefix} #{trace}")
        STDERR.puts("#{prefix} ---")
      end
      STDERR.puts("#{prefix} -------------------")
    end
  end
