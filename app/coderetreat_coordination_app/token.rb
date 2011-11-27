class CoderetreatCoordinationApp::Token
  TokenChars = (1..9).to_a + ('a'..'z').to_a
  def initialize(size = 10)
    @token = (1..size).map{TokenChars.sample}.join
  end

  def to_s
    @token
  end
end
