class SystemStatus
  def self.get
    OpenStruct.new({ load_avgs: load_avgs, mem: mem, swap: swap })
  end

  private

  def self.load_avgs
    `cat /proc/loadavg | awk '{ printf("%s %s %s", $1, $2, $3) }'`.split(' ')
  end

  def self.mem
    `free -m | awk '$1 ~ "Mem" { printf("%s %s", $3, $2) }'`.split(' ').map(&:to_i)
  end

  def self.swap
    `free -m | awk '$1 ~ "Swap" { printf("%s %s", $3, $2) }'`.split(' ').map(&:to_i)
  end
end
