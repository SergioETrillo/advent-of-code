require 'digest/md5'

class Miner
  ZEROS = 5
  def mine(secret)
    result = ""
    i = 0
    loop do
      i+=1
      result = Digest::MD5.hexdigest(secret + i.to_s)
      break if result[0..ZEROS-1] == "0"*ZEROS.to_s
    end
    i
  end
end