module Ryba
  class Address
    class<<self
      def index
        Ryba.pick(100000...700000)
      end

      def city
        Ryba.pick(Data::AllCities).gsub('_', ' ')
      end

      def full_city
        cty = Ryba.pick(Data::AllCities)
        h_cty = cty.gsub('_', ' ')

        region = Ryba.pick(Data::RegionByCities[cty])

        if Data::CitiesByRegion[region].first == cty
          "г. #{h_cty}"
        else
          "#{region}, г. #{h_cty}"
        end
      end

      def street
        Ryba.pick(Data::StreetNames)
      end

      BuildingFormats = [
        [ 'д. #', 90 ],
        [ 'д.#', 80 ],
        [ 'д. #/?', 15 ],
        [ 'д. #к?', 10 ],
        [ 'стр. #', 10 ],
        [ 'д.#/?', 5 ],
        [ 'д.#к?', 5 ],
        [ 'стр.#', 5 ],
      ].freeze

      ApartmentFormats = [
        [ 'кв. #', 10 ],
        [ 'оф. #', 10 ],
        [ '? этаж', 2 ],
        [ 'кв.#', 5 ],
        [ 'оф.#', 5 ],
        [ '?-й эт.', 1 ],
      ]

      def address
        building  = Ryba.pick(1..200)
        apartment = Ryba.pick(1..300)
        separator = Ryba.pick([' ', ', '])

        street + separator +
          if rand(10) < 2
            "#{building}-#{apartment}"
          else
            formatter = lambda do |fmts, num|
              Ryba.weighted_pick(fmts).gsub('#', num.to_s).gsub('?', Ryba.pick(1..9).to_s)
            end

            building  = formatter.call(BuildingFormats, building)
            apartment = formatter.call(ApartmentFormats, apartment)

            "#{building}#{separator}#{apartment}"
          end
      end

      def postal
        "#{index}, #{full_city}, #{address}"
      end
    end
  end
end
