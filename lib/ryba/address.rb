module Ryba
  class Address
    class<<self
      def index
        Ryba.pick(100000...700000)
      end

      def city
        Ryba.pick(Ryba::Data::AllCities).gsub('_', ' ')
      end

      def full_city
        cty = Ryba.pick(Ryba::Data::AllCities)
        h_cty = cty.gsub('_', ' ')

        region = Ryba.pick(Ryba::Data::RegionByCities[cty])

        if Ryba::Data::CitiesByRegion[region].first == cty
          "г. #{h_cty}"
        else
          "#{region}, г. #{h_cty}"
        end
      end
    end
  end
end
