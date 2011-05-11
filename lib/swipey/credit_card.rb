module Swipey
  class CreditCard
    attr_reader :first_name, :last_name, :data, :level, :card_number, :exp_date, :track2

    def initialize(str)
      @data = str
      get_data
    end

    def full_name
      "#{@first_name} #{@last_name}"
    end
    
    private

    def get_data
      extract_name
      extract_card_number
      extract_exp_date
      extract_track2
    end

    def extract_name
      begin
        @first_name = @data.split('^')[1].split('/').last.strip 
        @last_name = @data.split('^')[1].split('/').first.strip
      rescue
        nil
      end
    end

    def extract_card_number
      begin
        @card_number = @data.split('^')[0].gsub(/\D/, '')
      rescue
        nil
      end
    end

    def extract_exp_date
      begin
        exp = @data.split('^')[2][0..3]
        @exp_date = "#{exp[2..3]}#{exp[0..1]}"
      rescue
        nil
      end
    end
  
    def extract_track2
      begin
        @track2 = "#{@data.split('^')[2].split(';').last.gsub('?','')}"
      rescue
        nil
      end
    end
  end
end
