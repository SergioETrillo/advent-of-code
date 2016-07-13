require 'digest/md5'

class Miner

  def mine(secret)
    result = ""
    i = 0
    loop do
      i+=1
      result = Digest::MD5.hexdigest(secret + i.to_s)
      break if result[0..5] == "000000"
    end
    i
  end
end